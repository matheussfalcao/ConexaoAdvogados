require "test_helper"

class LawyersControllerTest < ActionDispatch::IntegrationTest
  test "should get verify_oab" do
    get lawyers_verify_oab_url
    assert_response :success
  end
end
