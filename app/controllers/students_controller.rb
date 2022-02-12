class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]

  # GET /students or /students.json
  def index
    @students = Student.all
  end

  # GET /students/1 or /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
    if params[:admin]
    session[:admin]=params[:admin]
    end
    
    
  end

  # GET /students/1/edit
  def edit
   
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        
        @user = User.new
        @user.email = @student.user_email
        @user.password_digest = @student.password_digest
        @user.role = 'STUDENT'
        @user.save
        if session[:admin]
         format.html{redirect_to  admin_path(session[:adminId]), notice: "Student was successfully created." }
        
        else
        format.html { redirect_to student_url(@student), notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    debugger
    respond_to do |format|
      if @student.update(student_params)
        if session[:admin]
          format.html { redirect_to students_path, notice: "Student was successfully updated." }
          format.json { render :show, status: :ok, location: @student }
        else
          format.html { redirect_to student_url(@student), notice: "Student was successfully updated." }
          format.json { render :show, status: :ok, location: @student }
        end
       
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end
 
  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy
    User.find_by_email(@student.user_email).destroy
    respond_to do |format|
      if session[:admin]
        format.html { redirect_to students_path, notice: "Student was successfully destroyed." }
        format.json { head :no_content }

      else
        format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
        format.json { head :no_content }
      end
      
    end
  end

  private
 
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :password, :password_confirmation, :dob, :user_email, :phone, :major)
    end
end
