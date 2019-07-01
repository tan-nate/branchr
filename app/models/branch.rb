class Branch < ActiveRecord::Base
  belongs_to :tree
  has_ancestry
end
