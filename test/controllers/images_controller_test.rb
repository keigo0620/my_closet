require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get images_create_url
    assert_response :success
  end

  test "should get index" do
    get images_index_url
    assert_response :success
  end

  test "should get show" do
    get images_show_url
    assert_response :success
  end

  test "should get edit" do
    get images_edit_url
    assert_response :success
  end

  test "should get update" do
    get images_update_url
    assert_response :success
  end

  test "should get destory" do
    get images_destory_url
    assert_response :success
  end

end
