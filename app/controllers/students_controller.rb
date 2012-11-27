class StudentsController < ApplicationController
  def index
  end

  def create
  	@student = Student.new(params[:student])
  	if @student.save
  		flash[:notice] = "Student record saved successfully."
  		redirect_to new_student_path
  	else
  		flash[:error] = "Unable to save. Please check all details."
      redirect_to new_student_path
    
  	end
  end

  def new
  	@student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
    
  end

  def update
   @student = Student.find(params[:id])
    if @student.update_attributes(params[:student])
      flash[:notice] =  "Academic updated successfully"
      redirect_to academics_path
    else
      flash[:error] = "Unable to update. Please check all details."
      redirect_to edit_student_path  @student
    end
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy 
    flash[:notice] = "Student academic record deleted successfully"
    redirect_to academics_path
  end

end
