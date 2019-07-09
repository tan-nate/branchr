class Branch < ActiveRecord::Base
  belongs_to :tree
  has_many :children, class_name: "Branch", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Branch"
end