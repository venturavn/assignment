class Cartitem < ActiveRecord::Base
  attr_accessible :product_id, :quantity, :user_id

    def self.page(conditions, page, per_page)
    paginate :per_page => per_page, :page => page,
             :order => 'id DESC',
             conditions: conditions,
             offset: per_page*(page-1),
             limit: per_page
  end
end
