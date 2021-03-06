require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: "Example", last_name: "User", email: "user@example.com", password: '123456')
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "first name should be present" do
    @user.first_name = "     "
    assert_not @user.valid?
  end


  test "last name should be present" do
    @user.last_name = "     "
    assert_not @user.valid?
  end

  test "first name should be at least 2 chars long" do
    @user.first_name = "a"
    assert_not @user.valid?
  end


  test "last name should be at least 2 chars long" do
    @user.last_name = "a"
    assert_not @user.valid?
  end


  test "first name should be equal or less than 20 chars long" do
    @user.first_name = "a" * 22
    assert_not @user.valid?
  end


  test "last name should be equal or less than 20 chars long" do
    @user.last_name = "a" * 22
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "password should be present" do
    @user.password = "     "
    assert_not @user.valid?
  end

  test "password should be at least 6 chars long" do
    @user.password = "12345"
    assert_not @user.valid?
  end

  test "email should be a valid email address" do
    @user.email = "1@1.aa"
    assert @user.valid?
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end
end
