class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :salt
  has_secure_password
  
  before_validation do |user|
  	user.email = user.email.downcase
  end

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with:VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :password_confirmation, presence:true

end
