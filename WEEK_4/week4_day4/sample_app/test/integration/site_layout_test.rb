=begin
require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pageshome'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help
    assert_select "a[href=?]", about
    assert_select "a[href=?]", contact
  end
end
=end