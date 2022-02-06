class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email_address(params[:email_address])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      case user.role
        when 'ADMIN'
          redirect_to admin_path
        when 'INSTRUCTOR'
          redirect_to instructor_path
        when 'STUDENT'
          redirect_to student_path
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
