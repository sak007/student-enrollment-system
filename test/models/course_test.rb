require "test_helper"

class CourseTest < ActiveSupport::TestCase
  setup do
    @course = courses(:one)
  end
  
  test 'valid course' do
    course = @course
    assert course.valid?
  end

  test 'invalid without name' do
    course = @course
    course.name = nil
    refute course.valid?
    assert_not_nil course.errors[:name]
  end

  test 'invalid without description' do
    course = @course
    course.description = nil
    refute course.valid?
    assert_not_nil course.errors[:description]
  end

  test 'invalid without instructor_id' do
    course = @course
    course.instructor_id = nil
    refute course.valid?
    assert_not_nil course.errors[:instructor_id]
  end

  test 'invalid without weekday1' do
    course = @course
    course.weekday1 = nil
    refute course.valid?
    assert_not_nil course.errors[:weekday1]
  end

  test 'invalid with non allowed weekday1' do
    course = @course
    course.weekday1 = 'SAT'
    refute course.valid?
    assert_not_nil course.errors[:weekday1]
  end

  test 'invalid with weekday1 not in caps' do
    course = @course
    course.weekday1 = 'Mon'
    refute course.valid?
    assert_not_nil course.errors[:weekday1]
  end

  test 'valid without weekday2 when weekday1 is available' do
    course = @course
    course.weekday1 = 'MON'
    course.weekday2 = nil
    assert course.valid?
  end

  test 'invalid without weekday2 when weekday1 is not available' do
    course = @course
    course.weekday1 = nil
    course.weekday2 = nil
    refute course.valid?
    assert_not_nil course.errors[:weekday1]
    assert_not_nil course.errors[:weekday2]
  end

  test 'invalid  starttime over 24hrs' do
    course = @course
    course.starttime = '25:10'
    refute course.valid?
    assert_not_nil course.errors[:starttime]
  end

  test 'invalid  starttime extra colon' do
    course = @course
    course.starttime = '25::90'
    refute course.valid?
    assert_not_nil course.errors[:starttime]
  end

  test 'invalid  starttime 12hrs format' do
    course = @course
    course.starttime = '9:10PM'
    refute course.valid?
    assert_not_nil course.errors[:starttime]
  end

  test 'invalid  starttime extra hrs digit' do
    course = @course
    course.starttime = '009:10'
    refute course.valid?
    assert_not_nil course.errors[:starttime]
  end

  test 'invalid  starttime extra min digit' do
    course = @course
    course.starttime = '9:100'
    refute course.valid?
    assert_not_nil course.errors[:starttime]
  end

  test 'invalid  endtime over 24hrs' do
    course = @course
    course.endtime = '25:10'
    refute course.valid?
    assert_not_nil course.errors[:endtime]
  end

  test 'invalid  endtime extra colon' do
    course = @course
    course.endtime = '25::90'
    refute course.valid?
    assert_not_nil course.errors[:endtime]
  end

  test 'invalid  endtime 12hrs format' do
    course = @course
    course.endtime = '9:10PM'
    refute course.valid?
    assert_not_nil course.errors[:endtime]
  end

  test 'invalid  endtime extra hrs digit' do
    course = @course
    course.endtime = '009:10'
    refute course.valid?
    assert_not_nil course.errors[:endtime]
  end

  test 'invalid  endtime extra min digit' do
    course = @course
    course.endtime = '9:100'
    refute course.valid?
    assert_not_nil course.errors[:endtime]
  end

  test 'invalid  endtime should not be equal to starttime' do
    course = @course
    course.endtime = '9:10'
    course.starttime = '9:10'
    refute course.valid?
    assert_not_nil course.errors[:endtime]
  end

  test 'invalid  endtime should not be equal to starttime 12hrs+' do
    course = @course
    course.endtime = '19:10'
    course.starttime = '19:10'
    refute course.valid?
    assert_not_nil course.errors[:endtime]
  end

  test 'invalid  endtime should not be equal to starttime 0hrs' do
    course = @course
    course.endtime = '00:10'
    course.starttime = '00:10'
    refute course.valid?
    assert_not_nil course.errors[:endtime]
  end

  test 'invalid  endtime should not be less than to starttime 0hrs' do
    course = @course
    course.endtime = '00:00'
    course.starttime = '00:10'
    refute course.valid?
    assert_not_nil course.errors[:endtime]
  end

  test 'invalid  endtime should not be less than to starttime' do
    course = @course
    course.endtime = '09:46'
    course.starttime = '12:10'
    refute course.valid?
    assert_not_nil course.errors[:endtime]
  end

  test 'invalid  endtime should not be less than to starttime 12hrs+' do
    course = @course
    course.endtime = '15:00'
    course.starttime = '17:00'
    refute course.valid?
    assert_not_nil course.errors[:endtime]
  end

  test 'invalid  endtime should not be less than to starttime prefix 0' do
    course = @course
    course.endtime = '05:50'
    course.starttime = '7:00'
    refute course.valid?
    assert_not_nil course.errors[:endtime]
  end

  test 'invalid without code' do
    course = @course
    course.code = nil
    refute course.valid?
    assert_not_nil course.errors[:code]
  end

  test 'invalid code not caps' do
    course = @course
    course.code = 'csc101'
    refute course.valid?
    assert_not_nil course.errors[:code]
  end

  test 'invalid code not all caps' do
    course = @course
    course.code = 'Csc101'
    refute course.valid?
    assert_not_nil course.errors[:code]
  end

  test 'invalid code extra char' do
    course = @course
    course.code = 'CCSC101'
    refute course.valid?
    assert_not_nil course.errors[:code]
  end

  test 'invalid code extra number' do
    course = @course
    course.code = 'CSC1010'
    refute course.valid?
    assert_not_nil course.errors[:code]
  end

  test 'invalid code extra number and char' do
    course = @course
    course.code = 'CSCC1010'
    refute course.valid?
    assert_not_nil course.errors[:code]
  end

  test 'invalid code char < 3' do
    course = @course
    course.code = 'CS101'
    refute course.valid?
    assert_not_nil course.errors[:code]
  end

  test 'invalid code int < 3' do
    course = @course
    course.code = 'CSC01'
    refute course.valid?
    assert_not_nil course.errors[:code]
  end

  test 'valid code' do
    course = @course
    course.code = 'CSC001'
    assert course.valid?
  end

  test 'invalid without capacity' do
    course = @course
    course.capacity = nil
    refute course.valid?
    assert_not_nil course.errors[:capacity]
  end

  test 'invalid without room' do
    course = @course
    course.room = nil
    refute course.valid?
    assert_not_nil course.errors[:room]
  end

  test 'invalid without status' do
    course = @course
    course.status = nil
    refute course.valid?
    assert_not_nil course.errors[:status]
  end


end
