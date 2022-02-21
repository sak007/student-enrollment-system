require "test_helper"

class AdminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = admins(:one)
    post sessions_path, params: { user_email: @admin.user_email, password: 'secret' }
  end

  test "should not get index" do
    assert_raise(Exception) {get admins_url}
  end

  test "should not get new" do
    assert_raise(Exception) {get new_admin_url}
  end

  test "should not create admin" do
    assert_raise(Exception) do
      post admins_url, params: { admin: { name: @admin.name, password: "secret", password_confirmation: "secret", phone: @admin.phone, user_email: @admin.user_email } }
    end
  end

  test "should show admin" do
    get admin_url(@admin)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_url(@admin)
    assert_response :success
  end

  test "should not destroy admin" do
    assert_raise(Exception) do
      delete admin_url(@admin)
    end

  end
end
