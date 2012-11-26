class StudentsController < ApplicationController
  def index
  end

  def create
  	@student = Student.new(params[:student])
  	if @student.save
  		flash[:notice] = "Student record saved successfully. Please enter a new record"
  		redirect_to new_student_path
  	else
  		flash[:notice] = "Unable to save student. Please check name and address."
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
   student = Student.find(params[:id])
    if student.update_attributes(params[:student])
      flash[:notice] =  "Academic updated successfully"
      redirect_to academics_path
    end
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy 
    flash[:notice] = "Student academic record deleted successfully"
    redirect_to academics_path
  end

end
