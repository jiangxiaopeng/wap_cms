require 'test_helper'

class TodayVideosControllerTest < ActionController::TestCase
  setup do
    @today_video = today_videos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:today_videos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create today_video" do
    assert_difference('TodayVideo.count') do
      post :create, today_video: {  }
    end

    assert_redirected_to today_video_path(assigns(:today_video))
  end

  test "should show today_video" do
    get :show, id: @today_video
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @today_video
    assert_response :success
  end

  test "should update today_video" do
    put :update, id: @today_video, today_video: {  }
    assert_redirected_to today_video_path(assigns(:today_video))
  end

  test "should destroy today_video" do
    assert_difference('TodayVideo.count', -1) do
      delete :destroy, id: @today_video
    end

    assert_redirected_to today_videos_path
  end
end
