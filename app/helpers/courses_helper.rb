module CoursesHelper
  def update_course_status(course)
    enrolled = Enrollment.where(course_id: course.id, status: 'ENROLLED').count
    wl = Enrollment.where(course_id: course.id, status: 'WAITLIST').count
    if course.capacity - enrolled > 0
      if wl > 0
        update_enrollment(course)
        update_course_status(course)
      else
        course.status = "OPEN"
      end
    elsif course.wlcapacity - wl > 0
      course.status = "WAITLIST"
    else
      course.status = "CLOSED"
    end
    course.save
  end

  private
  def update_enrollment(course)
    wle = Enrollment.where(course_id: course.id, status: 'WAITLIST').order("created_at").last
    debugger
    wle.status = 'ENROLLED'
    wle.save
  end
end
