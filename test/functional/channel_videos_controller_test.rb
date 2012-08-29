require 'test_helper'

class ChannelVideosControllerTest < ActionController::TestCase
  setup do
    @channel_video = channel_videos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:channel_videos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create channel_video" do
    assert_difference('ChannelVideo.count') do
      post :create, channel_video: {  }
    end

    assert_redirected_to channel_video_path(assigns(:channel_video))
  end

  test "should show channel_video" do
    get :show, id: @channel_video
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @channel_video
    assert_response :success
  end

  test "should update channel_video" do
    put :update, id: @channel_video, channel_video: {  }
    assert_redirected_to channel_video_path(assigns(:channel_video))
  end

  test "should destroy channel_video" do
    assert_difference('ChannelVideo.count', -1) do
      delete :destroy, id: @channel_video
    end

    assert_redirected_to channel_videos_path
  end
end
