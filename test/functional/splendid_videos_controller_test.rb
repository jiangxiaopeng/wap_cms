require 'test_helper'

class SplendidVideosControllerTest < ActionController::TestCase
  setup do
    @splendid_video = splendid_videos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:splendid_videos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create splendid_video" do
    assert_difference('SplendidVideo.count') do
      post :create, splendid_video: {  }
    end

    assert_redirected_to splendid_video_path(assigns(:splendid_video))
  end

  test "should show splendid_video" do
    get :show, id: @splendid_video
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @splendid_video
    assert_response :success
  end

  test "should update splendid_video" do
    put :update, id: @splendid_video, splendid_video: {  }
    assert_redirected_to splendid_video_path(assigns(:splendid_video))
  end

  test "should destroy splendid_video" do
    assert_difference('SplendidVideo.count', -1) do
      delete :destroy, id: @splendid_video
    end

    assert_redirected_to splendid_videos_path
  end
end
