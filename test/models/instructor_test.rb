require "test_helper"

class InstructorTest < ActiveSupport::TestCase
  setup do
    @instructor = instructors(:one)
  end

  test 'valid instructor' do
    instructor = @instructor
    assert instructor.valid?
  end

  test 'invalid without name' do
    instructor = @instructor
    instructor.name = nil
    refute instructor.valid?
    assert_not_nil instructor.errors[:name]
  end

  test 'invalid without email' do
    instructor = @instructor
    instructor.user_email = nil
    refute instructor.valid?
    assert_not_nil instructor.errors[:user_email]
  end

  test 'invalid email without prefix' do
    instructor = @instructor
    instructor.user_email = '@a.com'
    refute instructor.valid?
    assert_not_nil instructor.errors[:user_email]
  end

  test 'invalid email without sufix' do
    instructor = @instructor
    instructor.user_email = 'a@.com'
    refute instructor.valid?
    assert_not_nil instructor.errors[:user_email]
  end

  test 'invalid email without @' do
    instructor = @instructor
    instructor.user_email = 'a.com'
    refute instructor.valid?
    assert_not_nil instructor.errors[:user_email]
  end

  test 'invalid without department' do
    instructor = @instructor
    instructor.department = nil
    refute instructor.valid?
    assert_not_nil instructor.errors[:department]
  end


end
