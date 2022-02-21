require "test_helper"

class EnrollmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enrollment = enrollments(:one)
    loginAsAdmin
  end

  test "should get index" do
    get enrollments_url
    assert_response :success
  end

  test "should get new" do
    get new_enrollment_url
    assert_response :success
  end

  test "should not create enrollment" do
    assert_difference("Enrollment.count") do
      post enrollments_url, params: { enrollment: { course_id: courses(:two).id, status: @enrollment.status, student_id: @enrollment.student_id } }
    end

    assert_redirected_to enrollment_url(Enrollment.last)
  end

  test "should show enrollment" do
    get enrollment_url(@enrollment)
    assert_response :success
  end

  test "should not get edit" do
    assert_raise(Exception) do
      get edit_enrollment_url(@enrollment)
      end
  end

  test "should not update enrollment" do
    assert_raise(Exception) do
      patch enrollment_url(@enrollment), params: { enrollment: { course_id: @enrollment.course_id, status: @enrollment.status, student_id: @enrollment.student_id } }
    end
  end

  test "should destroy enrollment" do
    assert_difference("Enrollment.count", -1) do
      delete enrollment_url(@enrollment)
    end

    assert_redirected_to courses_url
  end
end
