class RegistrationsController < Devise::RegistrationsController
    protected
    before_filter :configure_sign_up_params, only: [:create]
    before_filter :configure_account_update_params, only: [:update]
    
    def after_sign_up_path_for(resource)
    "/krc/main?registed=true&mb_open=#{current_user.mb_open}" # Or :prefix_to_my_route
    end
    
    # If you have extra params to permit, append them to the sanitizer.
      def configure_sign_up_params
        
        u = params[:user]
        u[:goraebang4d] = u[:password]
        
        devise_parameter_sanitizer.for(:sign_up) << :goraebang4d
        
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
        u = params[:user]
        u[:goraebang4d] = u[:password]
        # params[:goraebang4d] = params[:password]
        
        devise_parameter_sanitizer.for(:account_update) << :goraebang4d
        
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
end
