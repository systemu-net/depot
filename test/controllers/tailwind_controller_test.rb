require "test_helper"

class TailwindControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tailwind_index_url
    assert_response :success
  end
end
