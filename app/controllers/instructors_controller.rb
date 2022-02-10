class InstructorsController < ApplicationController
  before_action :set_instructor, only: %i[ show edit update destroy ]

  # GET /instructors or /instructors.json
  def index
    @instructors = Instructor.all
  end

  # GET /instructors/1 or /instructors/1.json
  def show
  end

  # GET /instructors/new
  def new
    @instructor = Instructor.new
    if params[:admin]
      session[:admin]=params[:admin]
      end
  end

  # GET /instructors/1/edit
  def edit
  end

  # POST /instructors or /instructors.json
  def create
    @instructor = Instructor.new(instructor_params)

    respond_to do |format|
      if @instructor.save
        
        @user = User.new
        @user.email = @instructor.user_email
        @user.password_digest = @instructor.password_digest
        @user.role = 'INSTRUCTOR'
        @user.save
        if session[:admin]
          format.html{redirect_to admins_path, notice: "Instructor was successfully created." }
         
         else
        format.html { redirect_to instructor_url(@instructor), notice: "Instructor was successfully created." }
        format.json { render :show, status: :created, location: @instructor }
         end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instructors/1 or /instructors/1.json
  def update
    respond_to do |format|
      if @instructor.update(instructor_params)
        if session[:admin]
          format.html { redirect_to showAllInstructors_path, notice: "Instructor was successfully updated." }
          format.json { render :show, status: :ok, location: @instructor }
        else
          format.html { redirect_to instructor_url(@instructor), notice: "Instructor was successfully updated." }
        format.json { render :show, status: :ok, location: @instructor }
        end
        
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instructors/1 or /instructors/1.json
  def destroy
    @instructor.destroy

    respond_to do |format|
      if session[:admin]
        format.html { redirect_to showAllInstructors_path, notice: "Instructor was successfully destroyed." }
        format.json { head :no_content }

      else
      format.html { redirect_to instructors_url, notice: "Instructor was successfully destroyed." }
      format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instructor
      @instructor = Instructor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def instructor_params
      params.require(:instructor).permit(:name, :user_email, :password, :password_confirmation, :department)
    end
end
