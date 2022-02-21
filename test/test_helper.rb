ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def loginAsAdmin
    @admin = admins(:one)
    post sessions_path, params: { user_email: @admin.user_email, password: 'secret' }
  end

  def loginAsInstructor
    @instructor = instructors(:one)
    post sessions_path, params: { user_email: @instructor.user_email, password: 'secret' }
  end

  def loginAsStudent
    @student = students(:one)
    post sessions_path, params: { user_email: @student.user_email, password: 'secret' }
  end

end
