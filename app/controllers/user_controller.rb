class UserController < ApplicationController
  def register
    if session[:userid]
      @user = User.find_by_id(session[:userid])
      if @user
        cookie_flash_add notice: "You've already loged in."
        redirect_to root_url and return;
      end
    end
  	@user ||= User.new
  	def @user.flag
  		"register"
  	end
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:success] = "You have been registered successfully, have fun!"
  		session[:userid] = @user.id
      redirect_to root_url
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
      backup_referer params[:referer]
      redirect_to action: 'login'
    end
  end

  def logout
    if session[:userid]
      reset_session
      flash[:success] = "Loging out sucessfully!"
    else
      cookie_flash_add(error: "You haven't login yet!")
    end
    redirect_to root_url
  end

  def profile
    require_user profile_path
  end

  def update
    if session[:userid]
      @user = User.find_by_id(session[:userid])
      if @user
        if @user.authenticate(params[:user][:old_password])
          params[:user].delete(:old_password)
          if !@user.update_attributes(params[:user])
            render 'usercp'
            return
          end
          cookie_flash_add(success: "Your Password updated successfully!")
          redirect_to action: 'profile'
        else
          cookie_flash_add(error: "Your old Password isn't correct!")
          redirect_to action: 'usercp'
        end
      else
        cookie_flash_add(notice: "You haven't login yet!")
        redirect_to action: 'login'
      end
    else
      cookie_flash_add(error: "You haven't login yet!")
      redirect_to root_url
    end
  end
end
