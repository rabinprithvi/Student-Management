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
end
