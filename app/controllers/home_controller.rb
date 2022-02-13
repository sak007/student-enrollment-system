class HomeController < ApplicationController
  skip_before_action :authorized, only: [:index]
  def index
    if session[:id]
      case session[:role]
      when 'ADMIN'
        redirect_to admin_path session[:id]
      when 'INSTRUCTOR'
        redirect_to instructor_path session[:id]
      when 'STUDENT'
        redirect_to student_path session[:id]
      end
    end
  end
end
