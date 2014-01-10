require 'test_helper'

class TsgsControllerTest < ActionController::TestCase
  setup do
    @tsg = tsgs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tsgs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tsg" do
    assert_difference('Tsg.count') do
      post :create, tsg: { department: @tsg.department, name: @tsg.name }
    end

    assert_redirected_to tsg_path(assigns(:tsg))
  end

  test "should show tsg" do
    get :show, id: @tsg
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tsg
    assert_response :success
  end

  test "should update tsg" do
    put :update, id: @tsg, tsg: { department: @tsg.department, name: @tsg.name }
    assert_redirected_to tsg_path(assigns(:tsg))
  end

  test "should destroy tsg" do
    assert_difference('Tsg.count', -1) do
      delete :destroy, id: @tsg
    end

    assert_redirected_to tsgs_path
  end
end
