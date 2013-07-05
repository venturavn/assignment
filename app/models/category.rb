class Category < ActiveRecord::Base
  attr_accessible :id, :title, :yahoocatid
  has_many :products
end
