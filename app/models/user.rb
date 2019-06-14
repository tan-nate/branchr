class User < ActiveRecord::Base
  has_secure_password
  has_many :mashes, through: :user_mashes
end
