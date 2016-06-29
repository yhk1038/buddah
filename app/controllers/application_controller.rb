class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  
  
  $templete = ['introduce','map','org','org2','donate','open_board','list', 'center_history']
  $tab = Tab.all.order('turn asc')
end
