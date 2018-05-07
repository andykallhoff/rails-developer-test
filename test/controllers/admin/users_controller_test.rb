require 'test_helper'
include TestPasswordHelper

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  #--- LOGGED IN AS AN ADMIN
  describe "when logged in as admin" do
    setup do
      @user = users(:guest)
      @admin = users(:admin)
      sign_in @admin
    end

    test "should get index" do
      get admin_users_url
      assert_response :success
    end

    test "should get new" do
      get new_admin_user_url
      assert_response :success
    end

    test "should create user" do
      post admin_users_url, params: { user: { email: 'test@test.com', role: 'guest' } }
      assert_equal 'User was successfully created.', flash[:notice]
      assert_redirected_to admin_users_url
    end

    test "should render new if creating user has errors" do
      post admin_users_url, params: { user: { email: nil, role: 'guest' } }
      assert_template :new
    end

    test "should get edit" do
      get edit_admin_user_url(@user)
      assert_response :success
    end

    test "should update user" do
      patch admin_user_url(@user), params: {user: { role: 'editor' }}
      assert_equal 'User was successfully updated.', flash[:notice]
      assert_redirected_to admin_users_url
    end

    test "should render edit if updating user has errors" do
      patch admin_user_url(@user), params: {user: { email: nil }}
      assert_template :edit
    end

    test "should delete user" do
      delete admin_user_url(@user)
      assert_equal 'The user was deleted.', flash[:notice]
      assert_redirected_to admin_users_url
    end
  end

  #--- LOGGED IN AS A NON-ADMIN
  describe "when NOT logged in as admin" do
    setup do
      @user = users(:guest)
      @editor = users(:editor)
      sign_in @editor
    end

    test "should get index" do
      get admin_users_url
      assert_equal 'You are not authorized for that area of the site.', flash[:error]
      assert_redirected_to root_url
    end

    test "should get new" do
      get new_admin_user_url
      assert_equal 'You are not authorized for that area of the site.', flash[:error]
      assert_redirected_to root_url
    end

    test "should create user" do
      post admin_users_url, params: { user: { email: 'test@test.com', role: 'guest' } }
      assert_equal 'You are not authorized for that area of the site.', flash[:error]
      assert_redirected_to root_url
    end

    test "should get edit" do
      get edit_admin_user_url(@user)
      assert_equal 'You are not authorized for that area of the site.', flash[:error]
      assert_redirected_to root_url
    end

    test "should update user" do
      patch admin_user_url(@user), params: {user: { role: 'editor' }}
      assert_equal 'You are not authorized for that area of the site.', flash[:error]
      assert_redirected_to root_url
    end

    test "should delete user" do
      delete admin_user_url(@user)
      assert_equal 'You are not authorized for that area of the site.', flash[:error]
      assert_redirected_to root_url
    end
  end
end
