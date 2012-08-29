require 'test_helper'

class Wap::UsersControllerTest < ActionController::TestCase
  setup do
    @wap_user = wap_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wap_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wap_user" do
    assert_difference('Wap::User.count') do
      post :create, wap_user: {  }
    end

    assert_redirected_to wap_user_path(assigns(:wap_user))
  end

  test "should show wap_user" do
    get :show, id: @wap_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wap_user
    assert_response :success
  end

  test "should update wap_user" do
    put :update, id: @wap_user, wap_user: {  }
    assert_redirected_to wap_user_path(assigns(:wap_user))
  end

  test "should destroy wap_user" do
    assert_difference('Wap::User.count', -1) do
      delete :destroy, id: @wap_user
    end

    assert_redirected_to wap_users_path
  end
end
