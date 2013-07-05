class HomeController < ApplicationController
	def home
		@recommended_products = Product.find_by_sql %q{ SELECT * FROM (SELECT * FROM products WHERE review_rate>4 ORDER BY review_count DESC limit 0,12) AS T ORDER BY review_rate DESC; }
		@newest_products = Product.find(:all, limit: 15, order: "id DESC")
	end
end
