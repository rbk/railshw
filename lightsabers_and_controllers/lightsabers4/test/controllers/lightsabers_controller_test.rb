require 'test_helper'

class LightsabersControllerTest < ActionController::TestCase
  setup do
    @lightsaber = lightsabers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lightsabers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lightsaber" do
    assert_difference('Lightsaber.count') do
      post :create, lightsaber: { color: @lightsaber.color, darkside: @lightsaber.darkside, description: @lightsaber.description, image: @lightsaber.image, name: @lightsaber.name }
    end

    assert_redirected_to lightsaber_path(assigns(:lightsaber))
  end

  test "should show lightsaber" do
    get :show, id: @lightsaber
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lightsaber
    assert_response :success
  end

  test "should update lightsaber" do
    patch :update, id: @lightsaber, lightsaber: { color: @lightsaber.color, darkside: @lightsaber.darkside, description: @lightsaber.description, image: @lightsaber.image, name: @lightsaber.name }
    assert_redirected_to lightsaber_path(assigns(:lightsaber))
  end

  test "should destroy lightsaber" do
    assert_difference('Lightsaber.count', -1) do
      delete :destroy, id: @lightsaber
    end

    assert_redirected_to lightsabers_path
  end
end
