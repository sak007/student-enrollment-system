require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    loginAsAdmin
  end

  test "should not get index" do
    assert_raise(Exception) do
      get users_url
    end
  end

  test "should not get new" do
    assert_raise(Exception) do
      get new_user_url
    end
  end

  test "should not create user" do
    assert_raise(Exception) do
      post users_url, params: { user: { email: 'x@x.com', password: "secret", password_confirmation: "secret", role: @user.role } }
    end
  end

  test "should not show user" do
    assert_raise(Exception) do
      get user_url(@user)
    end
  end

  test "should not get edit" do
    assert_raise(Exception) do
      get edit_user_url(@user)
    end
  end

  test "should not update user" do
    assert_raise(Exception) do
      patch user_url(@user), params: { user: { email: @user.email, password: "secret", password_confirmation: "secret", role: @user.role } }
    end
  end

  test "should not destroy user" do
    assert_raise(Exception) do
      delete user_url(@user)
    end
  end
end
