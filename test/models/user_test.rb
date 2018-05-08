require 'test_helper'
include TestPasswordHelper

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    @user = users(:guest)
    assert @user.valid?
  end

  test 'will automatically set role to guest' do
    user = User.new(email: '2@test.com', password: '1234567890', password_confirmation: '1234567890')
    assert_equal user.role, 'guest'
  end

  test 'invalid without email' do
    user = User.new(password: '1234567890', password_confirmation: '1234567890')
    refute user.valid?
    assert_not_nil user.errors[:email]
  end

  test 'validates user roles' do
    user = User.new(email: '2@test.com', password: '1234567890', password_confirmation: '1234567890', role: 'demigod')
    refute user.valid?
    assert_not_nil user.errors[:role]
  end
end
