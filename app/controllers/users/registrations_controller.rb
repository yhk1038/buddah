class Users::RegistrationsController < Devise::RegistrationsController #회원(가입 수정 탈퇴)부
  before_filter :configure_sign_up_params, only: [:create]
  before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy

  #   if @user.destroy
  #       redirect_to '/', notice: "회원탈퇴를 성공적으로 마쳤습니다."
  #   end
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected
  
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:sign_up) << :nickname
    devise_parameter_sanitizer.for(:sign_up) << :mb_id
    devise_parameter_sanitizer.for(:sign_up) << :agree1
    devise_parameter_sanitizer.for(:sign_up) << :agree2
    
    devise_parameter_sanitizer.for(:sign_up) << :hint
    devise_parameter_sanitizer.for(:sign_up) << :ht_answer
    
    devise_parameter_sanitizer.for(:sign_up) << :phonenumber
    
    devise_parameter_sanitizer.for(:sign_up) << :birthy
    devise_parameter_sanitizer.for(:sign_up) << :birthm
    devise_parameter_sanitizer.for(:sign_up) << :birthd
    
    devise_parameter_sanitizer.for(:sign_up) << :issolar
    devise_parameter_sanitizer.for(:sign_up) << :islady
    
    devise_parameter_sanitizer.for(:sign_up) << :post
    devise_parameter_sanitizer.for(:sign_up) << :addr
    devise_parameter_sanitizer.for(:sign_up) << :addr2
    
    devise_parameter_sanitizer.for(:sign_up) << :mb_mailling
    devise_parameter_sanitizer.for(:sign_up) << :mb_open
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    # devise_parameter_sanitizer.for(:account_update) << :username
    devise_parameter_sanitizer.for(:account_update) << :nickname
    devise_parameter_sanitizer.for(:account_update) << :mb_id
    # devise_parameter_sanitizer.for(:account_update) << :agree1
    # devise_parameter_sanitizer.for(:account_update) << :agree2
    
    devise_parameter_sanitizer.for(:account_update) << :hint
    devise_parameter_sanitizer.for(:account_update) << :ht_answer
    
    devise_parameter_sanitizer.for(:account_update) << :phonenumber
    
    # devise_parameter_sanitizer.for(:account_update) << :birthy
    # devise_parameter_sanitizer.for(:account_update) << :birthm
    # devise_parameter_sanitizer.for(:account_update) << :birthd
    
    devise_parameter_sanitizer.for(:account_update) << :issolar
    devise_parameter_sanitizer.for(:account_update) << :islady
    
    devise_parameter_sanitizer.for(:account_update) << :post
    devise_parameter_sanitizer.for(:account_update) << :addr
    devise_parameter_sanitizer.for(:account_update) << :addr2
    
    devise_parameter_sanitizer.for(:account_update) << :mb_mailling
    devise_parameter_sanitizer.for(:account_update) << :mb_open
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
