class Category < ActiveRecord::Base
  has_many :words, through: :mashes
end
