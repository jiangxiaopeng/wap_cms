require 'test_helper'

class IndexVideosControllerTest < ActionController::TestCase
  setup do
    @index_video = index_videos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:index_videos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create index_video" do
    assert_difference('IndexVideo.count') do
      post :create, index_video: {  }
    end

    assert_redirected_to index_video_path(assigns(:index_video))
  end

  test "should show index_video" do
    get :show, id: @index_video
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @index_video
    assert_response :success
  end

  test "should update index_video" do
    put :update, id: @index_video, index_video: {  }
    assert_redirected_to index_video_path(assigns(:index_video))
  end

  test "should destroy index_video" do
    assert_difference('IndexVideo.count', -1) do
      delete :destroy, id: @index_video
    end

    assert_redirected_to index_videos_path
  end
end
