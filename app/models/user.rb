class User < ActiveRecord::Base
  has_secure_password
  has_many :mashes
  has_many :votes
end
