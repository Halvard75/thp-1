require 'test_helper'

class MoussaillonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @moussaillon = moussaillons(:one)
  end

  test "should get index" do
    get moussaillons_url
    assert_response :success
  end

  test "should get new" do
    get new_moussaillon_url
    assert_response :success
  end

  test "should create moussaillon" do
    assert_difference('Moussaillon.count') do
      post moussaillons_url, params: { moussaillon: { bio: @moussaillon.bio, email: @moussaillon.email, username: @moussaillon.username } }
    end

    assert_redirected_to moussaillon_url(Moussaillon.last)
  end

  test "should show moussaillon" do
    get moussaillon_url(@moussaillon)
    assert_response :success
  end

  test "should get edit" do
    get edit_moussaillon_url(@moussaillon)
    assert_response :success
  end

  test "should update moussaillon" do
    patch moussaillon_url(@moussaillon), params: { moussaillon: { bio: @moussaillon.bio, email: @moussaillon.email, username: @moussaillon.username } }
    assert_redirected_to moussaillon_url(@moussaillon)
  end

  test "should destroy moussaillon" do
    assert_difference('Moussaillon.count', -1) do
      delete moussaillon_url(@moussaillon)
    end

    assert_redirected_to moussaillons_url
  end
end
