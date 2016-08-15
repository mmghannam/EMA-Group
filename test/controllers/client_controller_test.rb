require 'test_helper'

class ClientControllerTest < ActionController::TestCase
  test "should get default" do
    get :default
    assert_response :success
  end

end
