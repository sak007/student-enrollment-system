class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:user_email])
    if user && user.authenticate(params[:password])
      session[:user] = user.email
      case user.role
      when 'ADMIN'
        admin = Admin.find_by_user_email(params[:user_email])
        redirect_to admin_path admin.id
      when 'INSTRUCTOR'
        instructor = Instructor.find_by_user_email(params[:user_email])
        redirect_to instructor_path instructor.id
      when 'STUDENT'
        student = Student.find_by_user_email(params[:user_email])
        redirect_to student_path student.id
      else
        flash.now[:alert] = "Invalid user role"
        render "new"
      end
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
  end
end
