class YahootestController < ApplicationController
  include YahootestHelper
  def index
    #@test = getJSON("http://shopping.yahooapis.jp/ShoppingWebService/V1/json/categorySearch?appid=dj0zaiZpPXpIMzBsMUQyTk55dSZkPVlXazlZWGxzYjNoWU0yVW1jR285TUEtLSZzPWNvbnN1bWVyc2VjcmV0Jng9MzI-&category_id=1")
    # for j in 21..21
    # category = Category.find_by_id(j)
    # for i in 0..19 do
    #   offset = i*50
    #   @test = getJSON("http://shopping.yahooapis.jp/ShoppingWebService/V1/json/itemSearch?appid=dj0zaiZpPXpIMzBsMUQyTk55dSZkPVlXazlZWGxzYjNoWU0yVW1jR285TUEtLSZzPWNvbnN1bWVyc2VjcmV0Jng9MzI-&category_id=#{category.yahoocatid}&hits=50&offset=#{offset}&sort=-sold")
    #   products = (ActiveSupport::JSON.decode (@test))["ResultSet"]["0"]["Result"]
    #   @test = ActiveSupport::JSON.encode products
    #   if (products)
    #     products.each do |index, productJSON|
    #       if (index.to_i.to_s == index.to_s)
    #         product = Product.new(name: productJSON["Name"], category_id:21, description: productJSON["Description"], image: productJSON["Image"]["Medium"], price_currency: productJSON["Price"]["_attributes"]["currency"], price_value: productJSON["Price"]["_value"], review_count:productJSON["Review"]["Count"], review_rate:productJSON["Review"]["Rate"])
    #         product.save
    #       end
    #     end
    #   end
    # end
    # end
  end
end
