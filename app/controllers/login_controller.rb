class LoginController < ApplicationController
  def index
  end

  def admin
  	
  end

  def authenticate
      uname = params[:uname]
    pword = params[:pword]

    if(uname == 'admin' && pword == '123')
      @status = 'true'
      render 'admin'
    else
      @status = 'false'
      flash[:notice] = "Username or Password is not correct"
      redirect_to root_url
  	
    end
  end

  
 

end


