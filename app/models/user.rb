class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :name, :password, :password_confirmation, :phone

  validates_uniqueness_of	:email

  has_one :rental
end
