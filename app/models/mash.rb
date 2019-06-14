class Mash < ActiveRecord::Base
  has_many :users, through: :user_mashes
  has_many :halves, class_name: "Mash", foreign_key: "whole_id"
  belongs_to :whole, class_name: "Mash"
end
