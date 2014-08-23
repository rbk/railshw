require 'test_helper'

class SatellitesControllerTest < ActionController::TestCase
  setup do
    @satellite = satellites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:satellites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create satellite" do
    assert_difference('Satellite.count') do
      post :create, satellite: { name: @satellite.name, parent_id: @satellite.parent_id }
    end

    assert_redirected_to satellite_path(assigns(:satellite))
  end

  test "should show satellite" do
    get :show, id: @satellite
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @satellite
    assert_response :success
  end

  test "should update satellite" do
    patch :update, id: @satellite, satellite: { name: @satellite.name, parent_id: @satellite.parent_id }
    assert_redirected_to satellite_path(assigns(:satellite))
  end

  test "should destroy satellite" do
    assert_difference('Satellite.count', -1) do
      delete :destroy, id: @satellite
    end

    assert_redirected_to satellites_path
  end
end
