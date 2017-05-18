require 'test_helper'

class UserRoadtripsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_roadtrip = user_roadtrips(:one)
  end

  test "should get index" do
    get user_roadtrips_url, as: :json
    assert_response :success
  end

  test "should create user_roadtrip" do
    assert_difference('UserRoadtrip.count') do
      post user_roadtrips_url, params: { user_roadtrip: { roadtrip_id: @user_roadtrip.roadtrip_id, user_id: @user_roadtrip.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show user_roadtrip" do
    get user_roadtrip_url(@user_roadtrip), as: :json
    assert_response :success
  end

  test "should update user_roadtrip" do
    patch user_roadtrip_url(@user_roadtrip), params: { user_roadtrip: { roadtrip_id: @user_roadtrip.roadtrip_id, user_id: @user_roadtrip.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy user_roadtrip" do
    assert_difference('UserRoadtrip.count', -1) do
      delete user_roadtrip_url(@user_roadtrip), as: :json
    end

    assert_response 204
  end
end
