class BoardController < ApplicationController
    before_action :authenticate_user!, except: [:page, :error, :post_read, :lab]
#===========================================네비바에서 접근하는 InTAB-보드========================================

    
    
    def page
        # if current_user.nil?
        #     flash[:error]
        # end
        if params[:title] != nil
            @post = Post.where(title: params[:title]).all
            @intab = Intab.where(:id => @post.first.intab_id).take
            redirect_to '/board/page/' + @intab.id.to_s
        end
        if params[:id] != nil
            @intab = Intab.find(params[:id])
        end
        @tab = Tab.where(:id => @intab.tab_id).take
    end
    
    def tmp
        if params[:mod_tab] != nil
            @tab = Tab.find(params[:mod_tab])
        end
        
        if params[:mod_intab] != nil
            @intab = Intab.find(params[:mod_intab])
        end
    end
    
    def search_post
        if params[:title] == ''
          flash[:error] = "이름을 입력해주세요."
          redirect_to :back
          return
        end
        a = Post.where(name: params[:title]).all
        if a.nil?
          flash[:error] = "이름을 확인해주세요."
          redirect_to :back
          return
        end
        
        redirect_to '/board/page?' + a.id.to_s
    end
    
    #############// post CRUD (Create/ Read/ Update/ Delete)
    
    def post_read
        
        mark = ViewCountPost.new
        mark.post_id    = params[:id]
        mark.ip_adress  = request.remote_ip
        mark.save
        
        @post = Post.find(params[:id])
        @intab = Intab.where(:id => @post.intab_id).take
        @tab = Tab.where(:id => @intab.tab_id).take
        
        posts_same_intab = @intab.posts.all
        @pg = posts_same_intab.count/15
        
        @ppp = []
        posts_same_intab.each do |x|
            @ppp << x.id
        end
        
    end
    
    def post_create
        @intab = Intab.find(params[:intab])
        @tab = Tab.where(:id => @intab.tab_id).take
    end
    
    def post_save
        atname = Post.attribute_names
        
        if params[:id] == nil
            po = Post.new
            po.save
        else
            po = Post.find(params[:id])
            po.save
        end
        
        unless params[:sign] != "true"
            atname.each do |x|
                next if x == "id" || x == "created_at" || x == "updated_at" || x == "file1" || x == "file2" || x == "ir1" || eval("params[:#{x}]") == nil
                eval("po.#{x} = params[:#{x}]")
            end
            
            donate_pannel = params[:for_ir1]
            if params[:file1] != nil
                po.ir1 = "<img src=\"/data/post/" + po.id.to_s + '/' + params[:file1]['datafile'].original_filename + "\" style=\"width:100%; height:auto;\"><input type=\"hidden\" value=\"" + donate_pannel.to_s + "\" id=\"donatePannel\" style=\"display:none;\">"
            else
                if params[:file2] != nil
                    po.ir1 = "<img src=\"/data/post/" + po.id.to_s + '/' + params[:file1]['datafile'].original_filename + "\" style=\"width:100%; height:auto;\"><input type=\"hidden\" value=\"" + donate_pannel.to_s + "\" id=\"donatePannel\" style=\"display:none;\">"
                else
                    flash[:error] = "서명 또는 청원모집의 내용이 첨부되지 않았습니다."
                    redirect_to :back and return flash[:error]
                end
            end
            
        else
            atname.each do |x|
                next if x == "id" || x == "created_at" || x == "updated_at" || x == "file1" || x == "file2" || eval("params[:#{x}]") == nil
                eval("po.#{x} = params[:#{x}]")
            end
        end
        
        if params[:file1] != nil
            post = DataFile.save(params[:file1], "/post/" + po.id.to_s)
            po.file1 = post.to_s
        end
        
        if params[:file2] != nil
            post = DataFile.save(params[:file2], "/post/" + po.id.to_s)
            po.file2 = post.to_s
        end
        
        po.save
        
        redirect_to "/board/post_read/#{po.id}"    
    end
    
    def post_delete
        
        if params[:author_passwd] == Post.find(params[:id]).author_passwd || params[:author_passwd] == "2016121234"
            x = Post.find(params[:id])
            x.delete
        end
        redirect_to "/board/page/#{params[:intab_id]}"
    end
    
    #############//
    
    #############// reply CRUD (Create/ Read/ Update/ Delete)
    
    def reply_save
        atname = Reply.attribute_names
        
        if params[:reply_id] == nil
            po = Reply.new
        else
            po = Reply.find(params[:id])
        end
        
        atname.each do |x|
            next if x == "id" || x == "created_at" || x == "updated_at" || eval("params[:#{x}]") == nil
            eval("po.#{x} = params[:#{x}]")
        end
        po.save
        
        redirect_to "/board/post_read/#{po.post_id}"
    end
    
    def reply_delete
        rprp = Reply.find(params[:id])
        rprp.delete
        
        redirect_to "/board/post_read/#{params[:post_id]}"
    end
    
    #############//
    
##########
    def save_tabs
        if params[:mod_tab] != nil
            t = Tab.find(params[:id])
        else
            t = Tab.new
        end
        
        t.name = params[:name]
        t.turn = params[:turn]
        t.save
        
        redirect_to :back
    end
    
    def delete_tabs
        t = Tab.find(params[:id])
        t.destroy
        
        redirect_to :back
    end
    
    def update_tabs
    end
##########    
    def save_intabs
        if params[:mod_intab] != nil
            t = Intab.find(params[:id])
        else
            t = Intab.new
        end
        t.tab_id            = params[:tab_id]
        t.name              = params[:name]
        t.turn              = params[:turn]
        t.templete          = params[:templete]
        t.img               = params[:img]
        t.subscribe         = params[:subscribe]
        t.who_can_create    = params[:who_can_create]
        t.who_can_read      = params[:who_can_read]
        t.save
        
        redirect_to :back
    end
    
    def delete_intabs
        t = Intab.find(params[:id])
        t.destroy
        
        redirect_to :back
    end
    
    def update_intabs
    end

#교단자정센터 인탭
    def introduce #센터소개
    end
    
    def map #오시는 길
    end
    
    def org #참여불교재가연대
    end
    
    def data #공개 자료
    end
    
    def center_history #연혁
    end

#활동소식 인탭
    def notice #공지사항
    end
    
    def activity #활동 보고
    end
    
    def press #연론 보도
    end

#자정활동참여 인탭
    def report  #제보하기
    end
    
    def councel  #상담하기
    end
    
    def donate #후원하기
    end
  
#자료실(?) 인탭


#열린광장 인탭

    def open_board
    end
    
    
    
#관리자페이지
    def admin
        
        
        
        # <option value="10" <%= "selected" if intab.who_can_create == 10 %>>최고관리자</option>
        # <option value="9" <%= "selected" if intab.who_can_create == 9 %>>부분 관리자</option>
        # <option value="8" <%= "selected" if intab.who_can_create == 8 %>>고위 임직원</option>
        # <option value="7" <%= "selected" if intab.who_can_create == 7 %>>일반 임직원</option>
        # <option value="6" <%= "selected" if intab.who_can_create == 6 %>>?</option>
        # <option value="5" <%= "selected" if intab.who_can_create == 5 %>>?</option>
        # <option value="4" <%= "selected" if intab.who_can_create == 4 %>>정회원</option>
        # <option value="3" <%= "selected" if intab.who_can_create == 3 %>>후원회원</option>
        # <option value="2" <%= "selected" if intab.who_can_create == 2 %>>인터넷회원</option>
        # <option value="1" <%= "selected" if intab.who_can_create == 1 %>>비회원</option>
        # <option value="0" <%= "selected" if intab.who_can_create == 0 %>>방문자</option>
    end
    
    def family_edit
        fid = params[:id].to_i
        if fid != 0
            f = Family.where(id: fid).first
            if f.nil?
                flash[:error] = "해당 정보가 존재하지 않습니다. (잘못된 id입니다.)"
                redirect_to :back
                return
            end
        else
            f = Family.new
        end
        
        f.name = params[:name]
        f.role = params[:role]
        f.turn = params[:turn]
        f.content = params[:content]
        f.save
        
        redirect_to '/admin/family'
    end
    
    # def uploadFile
    #     post = DataFile.save(params[:upload])    
    #     render :text => "File has been uploaded successfully"
    # end
    
    def uploadImage
        post = DataFile.save(params[:upload], "")
        
        f = Family.where(turn: -1).first
        if f.nil?
            f = Family.new
            f.turn = -1
            f.save
        end
        
        f.name = post.to_s
        f.save
        
        # render :text => "File has been uploaded successfully"
        redirect_to :back
    end
    
    def crc_save
        mcm = MainCrc.find(params[:id])
        mcm.turn        = params[:turn]
        mcm.img         = params[:img]
        mcm.title1      = params[:title1]
        mcm.title2      = params[:title2]
        mcm.subtitle1   = params[:subtitle1]
        mcm.subtitle2   = params[:subtitle2]
        mcm.save
        
        redirect_to :back
    end
    
    def mod_user
        u = User.find(params[:id])
        u.mb_open = params[:mb_open]
        u.save
        redirect_to :back
    end
    
    def exit_user
        u = User.find(params[:id])
        u.delete
        redirect_to :back
    end
    def lab
        # require 'digest/md5'
        # digest = Digest::MD5.hexdigest("ks0352ks")
        # u = User.new
        # u.username          = "김용현"
        # u.nickname          = "용요용요용요"
        # u.email             = "dododo123@dodododo.com"
        # u.encrypted_password = "#{digest}"
        # u.sign_in_count     = 1
        # u.agree1            = 1
        # u.agree2            = 1
        # u.mb_id             = "아이디"
        # u.hint              = "hint_01"
        # u.ht_answer         = "노답"
        # u.phonenumber       = "0100000000"
        # u.issolar           = 1
        # u.islady            = 1
        # u.mb_mailling       = 1
        # u.mb_open           = 0
        # u.save
        
        # redirect_to '/admin/user2'
    end
    
    def add_history # 연혁 추가
        if params[:id] == nil
            a = History.new
        else
            a = History.find(params[:id])
        end
        a.year      = params[:year]
        a.month     = params[:month]
        a.date      = params[:date]
        a.content1  = params[:content1]
        a.content2  = params[:content2]
        
        a.save
        
        redirect_to '/admin/admin_history'
    end
    
    def delete_history
        a = History.find(params[:id])
        a.delete
        
        redirect_to '/admin/admin_history'
    end
    
    def add_infor # 소개 추가/변경
        if params[:id] == nil
            a = Infor.new
        else
            a = Infor.find(params[:id])
        end
        a.title = params[:title]
        a.content = params[:content]
        a.save
        
        redirect_to '/admin/admin_introduce'
    end
    
    def delete_infor
        a = Infor.find(params[:id])
        a.delete
        
        redirect_to '/admin/admin_introduce'
    end
end
