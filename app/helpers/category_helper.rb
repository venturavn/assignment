module CategoryHelper
	def backup_referer
		session['backup_referer'] = session['referer']
	end
end
