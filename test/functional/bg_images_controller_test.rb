require 'test_helper'

class BgImagesControllerTest < ActionController::TestCase
  setup do
    @bg_image = bg_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bg_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bg_image" do
    assert_difference('BgImage.count') do
      post :create, bg_image: { file: @bg_image.file }
    end

    assert_redirected_to bg_image_path(assigns(:bg_image))
  end

  test "should show bg_image" do
    get :show, id: @bg_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bg_image
    assert_response :success
  end

  test "should update bg_image" do
    put :update, id: @bg_image, bg_image: { file: @bg_image.file }
    assert_redirected_to bg_image_path(assigns(:bg_image))
  end

  test "should destroy bg_image" do
    assert_difference('BgImage.count', -1) do
      delete :destroy, id: @bg_image
    end

    assert_redirected_to bg_images_path
  end
end
