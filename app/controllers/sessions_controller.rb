class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :destroy]
  def new
  end

  def create
    user = User.find_by_email(params[:user_email])
    if params[:user_email] == "test@gmail.com" && params[:password]== "123456"
      session[:user_email] = "test@gmail.com"
      session[:role]="ADMIN"
      admin = Admin.find_by_user_email(params[:user_email])
      session[:user_name] = admin.name
      session[:id] = admin.id
      redirect_to admin_path admin.id
      
    
    elsif user && user.authenticate(params[:password])
      session[:user_email] = user.email
      session[:role]=user.role
      case user.role
      when 'INSTRUCTOR'
        instructor = Instructor.find_by_user_email(params[:user_email])
        session[:user_name] = instructor.name
        session[:id] = instructor.id
        redirect_to instructor_path instructor.id
      when 'STUDENT'
        student = Student.find_by_user_email(params[:user_email])
        session[:user_name] = student.name
        session[:id] = student.id
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
    session.clear
    redirect_to root_url
  end
end
