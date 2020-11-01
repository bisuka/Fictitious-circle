require 'test_helper'

class Users::AnimeControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get users_anime_top_url
    assert_response :success
  end

end
