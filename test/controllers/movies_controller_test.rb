require "test_helper"

class MoviesControllerTest < ActionDispatch::IntegrationTest
  
  test "Should get movies" do
    get movies_path
    assert_response :success
    assert_select 'h2', text: 'All Movies'
  end
end
