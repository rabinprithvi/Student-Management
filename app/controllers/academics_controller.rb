require 'will_paginate/array'

class AcademicsController < ApplicationController

  def index  

    term = get_term(params[:terms])
    clas= get_class(params[:class])
    ac = Academic.get_by_term(term,clas) 

    @academics = ac.paginate(:page => params[:page] , :per_page => 5)
    @term = params[:terms]
    @class = clas
    
    respond_to do |format|
      format.html
      format.js
    end

  end


  def new
  	@academic = Academic.new
    @class= get_class(params[:class])
    @students = Student.find_all_by_classroom(@class)
  end

  def create
  	@academic = Academic.create(params[:academic])
  	if  @academic.save
  		flash[:notice] = "Student academic record saved successfully. Please enter another record"
  		redirect_to new_academic_path
   
  	else
  		flash[:notice] = "Unable to save. Please check rank and total."
  		redirect_to new_academic_path
  	end
  end

  def edit
    @academic = Academic.find(params[:id])
    @students = Student.all
  end

  def update
    academic = Academic.find(params[:id])
    if academic.update_attributes(params[:academic])
      flash[:notice] =  "Academic updated successfully"
      render 'login/admin'
    end
  end

  def destroy
    academic = Academic.find(params[:id])
    academic.destroy 
    flash[:notice] = "Student academic record deleted successfully"
    redirect_to( :back)
  end
#=======================================================================================================
  private 

  def get_term(term)

    if term
        p = term
        else
        p = "1"
     end

      if p == '1'
        term = 'Quarterly'
      elsif p == '2'
        term = 'Half yearly'
      else
        term = 'Annualy'
      end

  end

  def get_class(clas)
    if clas
        p = clas
        else
        p = '1'
     end

      if p == '1'
        term = 1
      elsif p == '2'
        term = 2
      else
        term = 3
      end
  end

end
