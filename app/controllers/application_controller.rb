class ApplicationController < ActionController::Base
	include ApplicationHelper
	include UserHelper
	
  protect_from_forgery
end
