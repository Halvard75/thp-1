require 'test_helper'

class DogsittersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dogsitter = dogsitters(:one)
  end

  test "should get index" do
    get dogsitters_url
    assert_response :success
  end

  test "should get new" do
    get new_dogsitter_url
    assert_response :success
  end

  test "should create dogsitter" do
    assert_difference('Dogsitter.count') do
      post dogsitters_url, params: { dogsitter: { first_name: @dogsitter.first_name, last_name: @dogsitter.last_name } }
    end

    assert_redirected_to dogsitter_url(Dogsitter.last)
  end

  test "should show dogsitter" do
    get dogsitter_url(@dogsitter)
    assert_response :success
  end

  test "should get edit" do
    get edit_dogsitter_url(@dogsitter)
    assert_response :success
  end

  test "should update dogsitter" do
    patch dogsitter_url(@dogsitter), params: { dogsitter: { first_name: @dogsitter.first_name, last_name: @dogsitter.last_name } }
    assert_redirected_to dogsitter_url(@dogsitter)
  end

  test "should destroy dogsitter" do
    assert_difference('Dogsitter.count', -1) do
      delete dogsitter_url(@dogsitter)
    end

    assert_redirected_to dogsitters_url
  end
end
