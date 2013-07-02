class Product < ActiveRecord::Base
  attr_accessible :id, :category_id, :description, :image, :name, :price_currency, :price_value, :review_count, :review_rate
end
