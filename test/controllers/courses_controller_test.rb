require "test_helper"

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:one)
  end

  test "admin should get index" do
    loginAsAdmin
    get courses_url
    assert_response :success
  end

  test "admin should get new" do
    loginAsAdmin
    get new_course_url
    assert_response :success
  end

  test "admin should create course" do
    loginAsAdmin
    assert_difference("Course.count") do
      post courses_url, params: { course: { capacity: 2, code: 'CSC102', description: 'Course X', endtime: '10:10', instructor_id: @course.instructor_id, name: 'Course X', room: 'R106', starttime: '9:10', status: 'OPEN', weekday1: 'MON', weekday2: 'THU', wlcapacity: 1 } }
    end
    assert_redirected_to course_url(Course.last)
  end

  test "admin should show course" do
    loginAsAdmin
    get course_url(@course)
    assert_response :success
  end

  test "admin should get edit" do
    loginAsAdmin
    get edit_course_url(@course)
    assert_response :success
  end

  test "admin should update course" do
    loginAsAdmin
    patch course_url(@course), params: { course: { capacity: @course.capacity, code: @course.code, description: @course.description, endtime: @course.endtime, instructor_id: @course.instructor_id, name: @course.name, room: @course.room, starttime: @course.starttime, status: @course.status, weekday1: @course.weekday1, weekday2: @course.weekday2, wlcapacity: @course.wlcapacity } }
    assert_redirected_to course_url(@course)
  end

  test "admin should destroy course" do
    loginAsAdmin
    assert_difference("Course.count", -1) do
      delete course_url(@course)
    end

    assert_redirected_to courses_url
  end

  # Student Context

  test "student should get index" do
    loginAsStudent
    get courses_url
    assert_response :success
  end

  test "student should not get new" do
    loginAsStudent
    get new_course_url
    assert_response :redirect
  end

  test "student should not create course" do
    loginAsStudent
    post courses_url, params: { course: { capacity: 2, code: 'CSC102', description: 'Course X', endtime: '10:10', instructor_id: @course.instructor_id, name: 'Course X', room: 'R106', starttime: '9:10', status: 'OPEN', weekday1: 'MON', weekday2: 'THU', wlcapacity: 1 } }
    assert_response :redirect
  end

  test "student should show course" do
    loginAsStudent
    get course_url(@course)
    assert_response :success
  end

  test "student should not get edit" do
    loginAsStudent
    get edit_course_url(@course)
    assert_response :redirect
  end

  test "should not update course" do
    loginAsStudent
    patch course_url(@course), params: { course: { capacity: @course.capacity, code: @course.code, description: @course.description, endtime: @course.endtime, instructor_id: @course.instructor_id, name: @course.name, room: @course.room, starttime: @course.starttime, status: @course.status, weekday1: @course.weekday1, weekday2: @course.weekday2, wlcapacity: @course.wlcapacity } }
    assert_response :redirect
  end

  test "should destroy course" do
    loginAsStudent
    delete course_url(@course)
    assert_response :redirect
  end

end
