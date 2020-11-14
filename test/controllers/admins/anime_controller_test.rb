require 'test_helper'

class Admins::AnimeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_anime_index_url
    assert_response :success
  end

  test "should get edit" do
    get admins_anime_edit_url
    assert_response :success
  end

  test "should get show" do
    get admins_anime_show_url
    assert_response :success
  end

  test "should get update" do
    get admins_anime_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_anime_destroy_url
    assert_response :success
  end

end
