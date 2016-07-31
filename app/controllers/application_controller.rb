class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  
  
  $templete = ['introduce','map','org','org2','donate','open_board','list', 'center_history']
  $tab = Tab.all.order('turn asc')
  
  $myInfo = ['@agree1', '@agree2', '@issolar', '@islady', '@mailling', '@name', '@nickname', '@member_id', '@address', '@phonenumber', '@birth', '@email', '@myinfo_arr', '@myinfo_arr2']
end
