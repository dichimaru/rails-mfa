require 'test_helper'

class UserMfaSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new,create" do
    get user_mfa_sessions_new,create_url
    assert_response :success
  end

end
