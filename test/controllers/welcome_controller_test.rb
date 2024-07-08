require "test_helper"

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get welcome_home_url
    assert_response :success

    assert_select 'h1', text: "Welcome#home"
  end
end
