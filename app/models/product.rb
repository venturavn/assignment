class Product < ActiveRecord::Base
  attr_accessible :id, :category_id, :description, :image, :name, :price_currency, :price_value, :review_count, :review_rate, :user_id
  belongs_to :category


  def self.page(conditions, page, per_page)
    paginate :per_page => per_page, :page => page,
             :order => 'id DESC',
             conditions: conditions,
             offset: per_page*(page-1),
             limit: per_page
  end

  before_validation do |p|
    p[:price_currency] = "JPY"
    p[:image] = ""
    p[:review_count] = 0
    p[:review_rate] = 2.5
    p[:image] = "http://i.yimg.jp/images/sh/noimage/146x146.gif"
  end

  validates :name, presence:true, length: {maximum:255, minimum:1}
  validates :category_id, presence: true, numericality: true
  validates :description, presence:true
  validates :price_value, presence: true

  after_validation do |p|
    p[:price_value] = p[:price_value].to_f
    end
end
