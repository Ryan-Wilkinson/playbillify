require 'test_helper'

class ScaffoldControllerTest < ActionDispatch::IntegrationTest
  test "should get Organization" do
    get scaffold_Organization_url
    assert_response :success
  end

end
