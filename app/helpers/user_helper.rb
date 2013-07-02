module UserHelper
	def get_user
		@user ||=	if !session[:userid] then nil else User.find_by_id(session[:userid]) end
		@user
	end
end
