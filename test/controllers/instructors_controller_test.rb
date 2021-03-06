require "test_helper"

class InstructorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @instructor = instructors(:one)
    post sessions_path, params: { user_email: @instructor.user_email, password: 'secret' }

  end

  test "should get index" do
    get instructors_url
    assert_response :success
  end

  test "should get new" do
    get new_instructor_url
    assert_response :redirect
  end

  test "should create instructor" do
    post instructors_url, params: { instructor: { department: @instructor.department, name: @instructor.name, password: "secret", password_confirmation: "secret", user_email: @instructor.user_email } }

    assert_response :redirect
  end

  test "should show instructor" do
    get instructor_url(@instructor)
    assert_response :success
  end

  test "should get edit" do
    get edit_instructor_url(@instructor)
    assert_response :success
  end

  test "should update instructor" do
    patch instructor_url(@instructor), params: { instructor: { department: @instructor.department, name: @instructor.name, password: "secret", password_confirmation: "secret", user_email: @instructor.user_email } }
    assert_redirected_to instructor_url(@instructor)
  end

  test "should destroy instructor" do
    assert_difference("Instructor.count", -1) do
      delete instructor_url(@instructor)
    end

    assert_redirected_to instructors_url
  end
end
