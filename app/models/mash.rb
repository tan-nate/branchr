class Mash < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :halves, class_name: "Mash", foreign_key: "whole_id"
  belongs_to :whole, class_name: "Mash"
end
