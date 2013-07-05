module UserHelper
	def get_user
		@user ||=	if !session[:userid] then nil else User.find_by_id(session[:userid]) end
		@user
	end
  def require_user path
    if !session[:userid]
      cookie_flash_add(notice: "You haven't login yet!")

      if path == :default
        backup_referer :session
      else
        backup_referer path
      end

      redirect_to controller:'user', action: 'login'
      false
    else
      true
    end
  end
end
