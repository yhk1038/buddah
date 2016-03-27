class KrcController < ApplicationController
  
  def main
    @bg = ["https://drscdn.500px.org/photo/66007189/q%3D80_m%3D2000/53f84eed281208de771e12317520398b",
          "https://drscdn.500px.org/photo/37025002/q%3D80_m%3D2000/e24b6abea3de45166a342e23432a307b",
          "https://drscdn.500px.org/photo/30384243/q%3D80_m%3D2000/367c79cc52501d25f729684930d3d8c1",
          "https://drscdn.500px.org/photo/65832547/q%3D80_m%3D2000/037a0817265469dbd7f3ce9e99a101af",
          "../img/main_bn.jpg"
          ]
    if current_user
      x = current_user
      
      if x.agree1 == 1                  #자정센터 약관 동의여부
        @agree1       = '동의'
      else
        @agree1       = '동의하지 않음'
      end
      if x.agree2 == 1                  #개인정보 수집정책 동의여부
        @agree2       = '동의'
      else
        @agree2       = '동의하지 않음'
      end
      if x.issolar == 1                 #양력/음력
        @issolar      = '양력'
      else
        @issolar      = '음력'
      end
      if x.islady == 1                  #성별
        @islady       = '여성'
      else
        @islady       = '남성'
      end
      if x.mb_mailling == 1             #이메일 수신
        @mailling     = '허용'
      else
        @mailling     = '허용하지 않음'
      end
      
      @name           = x.username      #이름
      @nickname       = x.nickname      #닉네임
      @member_id      = x.mb_id         #아이디
      @address        = x.addr + x.addr2  #주소
      @phonenumber    = x.phonenumber   #전화번호
      @birth          = @issolar + " " + x.birthy.to_s + "년 " + x.birthm.to_s + "월 " + x.birthd.to_s + "일"     #생년월일
      @email          = x.email         #이메일
      
      @myinfo_arr = Array.new
      @myinfo_arr2 = Array.new
      @myinfo_arr = ['name','nickname','member_id','islady','birth','phonenumber','email','mailling','address','agree1','agree2']
                      # 이름 닉네임 / 아이디 성별 / 생년월일 전화번호 / 이메일 메일링 / 주소 / 동의1+동의2 /
      @myinfo_arr2 = ['이름', '닉네임','아이디','성별','생년월일','연락처','이메일','이메일 수신','주소','자정센터 약관','개인정보 수집정책']
    end
    
    
    @tab = Tab.all.order('turn asc')
    
    
  end
  
  def pre_sign
  end
  
  def parameter_check
    if params[:agree1] == '1' || params[:agree2] == '1'
      redirect_to '/users/sign_up?agree1=1&agree2=1'
    else
      flash[:error] = '약관에 동의하셨나요? 다시 한 번 확인해주세요^^'
      redirect_to :back
    end
  end
  
  def destroy_user
  
    @user = User.find(params[:id])
    if @user.mb_id == params[:mb_id] && @user.password == params[:password]
      @user.destroy
    end

    if @user.destroy
        flash[:special_message] = "회원탈퇴를 성공적으로 마쳤습니다."
    else
        flash[:special_message] = "회원탈퇴에 실패했습니다. 회원탈퇴를 다시 시도해 주세요!"
    end
    
    #return root_url
    redirect_to '/'
  end
end
