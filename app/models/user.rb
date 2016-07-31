class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # has_many :pswds
  
  def self.create! user
    user.each do |m|
      u = User.new
      User.attribute_names.each do |x|
        eval("u.#{x} = m[:#{x}]")
      end
      u.password = m[:password]
      u.goraebang4d = m[:password]
      u.save!
    end
  end
  
  def authority
    if self.mb_open == 10
      mb_open = '최고관리자'
    elsif self.mb_open == 9
        mb_open = '사이트관리자'
    elsif self.mb_open == 8
        mb_open = '직원'
    elsif self.mb_open == 5
        mb_open = '일반 관리자'
    elsif self.mb_open == 3
        mb_open = '정회원'
    elsif self.mb_open < 3
        mb_open = '인터넷회원'
    elsif self.mb_open == nil
        mb_open = '방문자'
    end
    return mb_open
  end
  
  def for_myInfo_modal
    
      x = self
      
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
    
    return @agree1, @agree2, @issolar, @islady, @mailling, @name, @nickname, @member_id, @address, @phonenumber, @birth, @email, @myinfo_arr, @myinfo_arr2
  end
end
