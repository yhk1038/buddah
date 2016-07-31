class KrcController < ApplicationController
  
  def popup
  end
  
  def main
    
    mark = ViewCountSite.new
    mark.ip_address  = request.remote_ip
    mark.view_date = Date.current.in_time_zone.to_date.to_s
    mark.save
    
    @bg = ["https://drscdn.500px.org/photo/66007189/q%3D80_m%3D2000/53f84eed281208de771e12317520398b",
          "https://drscdn.500px.org/photo/37025002/q%3D80_m%3D2000/e24b6abea3de45166a342e23432a307b",
          "https://drscdn.500px.org/photo/30384243/q%3D80_m%3D2000/367c79cc52501d25f729684930d3d8c1",
          "https://drscdn.500px.org/photo/65832547/q%3D80_m%3D2000/037a0817265469dbd7f3ce9e99a101af",
          "../img/main_bn.jpg"
          ]
    if current_user
      x = current_user.for_myInfo_modal
      i = 0
      $myInfo.each do |info|
        eval("#{info} = x[#{i}]")
        i += 1
      end
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
