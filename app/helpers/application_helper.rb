module ApplicationHelper

	def page_title (title) 
		if title
			"#{title} - VenShop"
		else 
			"VenShop"
		end
	end

	def cookie_flash
		@cookie_flash = if cookies[:flash]
			ActiveSupport::JSON.decode cookies[:flash]
		else
		 nil
		end
		cookies.delete :flash
		@cookie_flash
	end
	def cookie_flash_add (message)
		if cookies[:flash]
			cookies[:flash] = ActiveSupport::JSON.encode(ActiveSupport::JSON.decode (cookies[:flash]) <<  message)
		else 
			cookies[:flash] = ActiveSupport::JSON.encode(Array[message])
		end
	end

	def backup_referer temp_referer
		if temp_referer != :session
			session['backup_referer'] = temp_referer
		else 
			session['backup_referer'] = session['referer']
		end
		session.delete('referer')
	end
end
