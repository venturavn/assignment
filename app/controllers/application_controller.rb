class ApplicationController < ActionController::Base
	include ApplicationHelper
	include UserHelper
	before_filter :save_referer, :get_user
	def save_referer
    session['referer'] = session['backup_referer'] || (request.referer || 'none')
    if session['backup_referer']
    	session.delete('backup_referer')
    end
    session['referer']
  end
  protect_from_forgery
end
