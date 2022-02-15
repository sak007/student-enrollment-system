class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]
  before_action :can_edit, only: [:edit, :update, :destroy]
  before_action :can_create, only: [:new, :create]
  # GET /courses or /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1 or /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
    if params[:admin]
      session[:admin]=params[:admin]
      end
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)

    if session[:role] == 'INSTRUCTOR'
      @course.instructor_id = session[:id]
    end

    helpers.update_course_status(@course)

    respond_to do |format|
      if @course.save
        format.html { redirect_to course_url(@course), notice: "Course was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    @course.assign_attributes(course_params)
    helpers.update_course_status(@course)
    respond_to do |format|
      if @course.update(course_params)
        if session[:admin]
          format.html { redirect_to courses_path, notice: "Course was successfully updated." }
          format.json { render :show, status: :ok, location: @course }
        else
        format.html { redirect_to course_url(@course), notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @course.destroy

    respond_to do |format|
      if session[:admin]
        format.html { redirect_to courses_path, notice: "Course was successfully destroyed." }
        format.json { head :no_content }
      else  
        format.html { redirect_to courses_url, notice: "Course was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:name, :description, :instructor_id, :weekday1, :weekday2, :starttime, :endtime, :code, :capacity, :wlcapacity, :status, :room)
    end

  def can_edit
    if session[:role] == 'STUDENT'
      redirect_to root_path
    elsif session[:role] == 'INSTRUCTOR'
      if @course.instructor_id != session[:id]
        redirect_to root_path
      end
    elsif session[:role] != 'ADMIN'
      redirect_to root_path
    end
  end

  def can_create
    
    if session[:role] != 'ADMIN' and session[:role] != 'INSTRUCTOR' 
      redirect_to root_path
    end
  end
end
