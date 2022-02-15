class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: %i[ show edit update destroy ]
  before_action :can_delete, only: [:destroy, :show]
  # GET /enrollments or /enrollments.json
  def index
    if session[:role] == 'ADMIN'
      @enrollments = Enrollment.all
    elsif session[:role] == 'STUDENT'
      @enrollments = Enrollment.where(student_id: session[:id])
    elsif session[:role] == 'INSTRUCTOR'
      @enrollments = Enrollment.where(course_id: Course.where(instructor_id: session[:id]).pluck(:course_id))
    end
  end

  # GET /enrollments/1 or /enrollments/1.json
  def show
  end

  # GET /enrollments/new
  def new
    @enrollment = Enrollment.new
    if params[:course_id]
      course = Course.find(params[:course_id])
      if session[:role] == 'ADMIN' or session[:role] == 'INSTRUCTOR'
        student_id = params[:student_id]
      else
        student_id = session[:id]
      end
      if course.status == "CLOSED"
        redirect_to courses_path
      else
        @enrollment.student_id = student_id
        @enrollment.course_id = course.id
        if course.status == 'OPEN'
          @enrollment.status = 'ENROLLED'
        else
          @enrollment.status = 'WAITLIST'
        end
        @enrollment.save
        helpers.update_course_status(course)
        redirect_to courses_path
      end
    end
  end

  # GET /enrollments/1/edit
  def edit
  end

  # POST /enrollments or /enrollments.json
  def create
    @enrollment = Enrollment.new(enrollment_params)

    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to enrollment_url(@enrollment), notice: "Enrollment was successfully created." }
        format.json { render :show, status: :created, location: @enrollment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enrollments/1 or /enrollments/1.json
  def update
    respond_to do |format|
      if @enrollment.update(enrollment_params)
        format.html { redirect_to enrollment_url(@enrollment), notice: "Enrollment was successfully updated." }
        format.json { render :show, status: :ok, location: @enrollment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollments/1 or /enrollments/1.json
  def destroy
    course = Course.find(@enrollment.course_id)
    @enrollment.destroy
    msg= "You have dropped this course successfully."
    helpers.update_course_status(course)
    if params[:course_id]
      msg = "The student has been dropped successfully"
    end
    respond_to do |format|
      format.html { redirect_to courses_url, notice: msg }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enrollment_params
      params.require(:enrollment).permit(:course_id, :student_id, :status)
    end

    def can_delete
      if session[:role] == 'STUDENT'
        if @enrollment.student_id != session[:id]
          redirect_to root_path
        end
      elsif session[:role] == 'INSTRUCTOR'
        if Course.find(@enrollment.course_id).instructor_id != session[:id]
          redirect_to root_path
        end
      elsif session[:role] != 'ADMIN'
        redirect_to root_path
      end
    end
end
