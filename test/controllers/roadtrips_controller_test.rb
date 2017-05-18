require 'test_helper'

class RoadtripsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @roadtrip = roadtrips(:one)
  end

  test "should get index" do
    get roadtrips_url, as: :json
    assert_response :success
  end

  test "should create roadtrip" do
    assert_difference('Roadtrip.count') do
      post roadtrips_url, params: { roadtrip: { name: @roadtrip.name } }, as: :json
    end

    assert_response 201
  end

  test "should show roadtrip" do
    get roadtrip_url(@roadtrip), as: :json
    assert_response :success
  end

  test "should update roadtrip" do
    patch roadtrip_url(@roadtrip), params: { roadtrip: { name: @roadtrip.name } }, as: :json
    assert_response 200
  end

  test "should destroy roadtrip" do
    assert_difference('Roadtrip.count', -1) do
      delete roadtrip_url(@roadtrip), as: :json
    end

    assert_response 204
  end
end
