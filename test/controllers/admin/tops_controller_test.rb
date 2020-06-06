require 'test_helper'

class Admin::TopsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get admin_tops_top_url
    assert_response :success
  end

end
