require 'net/http'
module YahootestHelper
	def getJSON (url)
		url = URI.parse(url)
		res = Net::HTTP.get_response(url)
		return res.body
	end
end
