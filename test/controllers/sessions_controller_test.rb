require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should not get new" do
    assert_raise(Exception) do
      get sessions_new_url
    end
  end

  test "should not get create" do
    assert_raise(Exception) do
      get sessions_create_url
    end
  end

  test "should not get destroy" do
    assert_raise(Exception) do
      get sessions_destroy_url
    end
  end
end
