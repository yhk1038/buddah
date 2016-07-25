require 'test_helper'

class EtcconfigControllerTest < ActionController::TestCase
  test "should get font_family" do
    get :font_family
    assert_response :success
  end

end
