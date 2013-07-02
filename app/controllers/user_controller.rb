class UserController < ApplicationController
  def register
  	@user ||= User.new
  	def @user.flag 
  		"register"
  	end
  end
  
  def create 
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:success] = "You have been loging in sucessfully!"
  		session[:userid] = @user.id
  	else 
  		render 'register'
  	end
  end

  def login
  	@user = User.new
  end

  def login_check
    user = User.find_by_email(params[:user][:email].downcase)
    if (user && user.authenticate(params[:user][:password]))
      session[:userid] = user.id
      cookie_flash_add(success: "Login successfully!")
      redirect_to params[:referer]
    else
      cookie_flash_add(error: "Login fail, please try again!")
      redirect_to 'user/login'
    end
  end


  def logout
    if session[:userid]
      reset_session
      cookie_flash_add(success: "Loging out sucessfully!")
    else
      cookie_flash_add(error: "You are not loging in!")
    end
    redirect_to root_url
  end
end
