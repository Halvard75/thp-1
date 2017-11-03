require 'test_helper'

class StrollsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stroll = strolls(:one)
  end

  test "should get index" do
    get strolls_url
    assert_response :success
  end

  test "should get new" do
    get new_stroll_url
    assert_response :success
  end

  test "should create stroll" do
    assert_difference('Stroll.count') do
      post strolls_url, params: { stroll: { date: @stroll.date } }
    end

    assert_redirected_to stroll_url(Stroll.last)
  end

  test "should show stroll" do
    get stroll_url(@stroll)
    assert_response :success
  end

  test "should get edit" do
    get edit_stroll_url(@stroll)
    assert_response :success
  end

  test "should update stroll" do
    patch stroll_url(@stroll), params: { stroll: { date: @stroll.date } }
    assert_redirected_to stroll_url(@stroll)
  end

  test "should destroy stroll" do
    assert_difference('Stroll.count', -1) do
      delete stroll_url(@stroll)
    end

    assert_redirected_to strolls_url
  end
end
