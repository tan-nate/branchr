class Branch < ActiveRecord::Base
  belongs_to :tree
  has_many :children, class_name: "Branch", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Branch"

  def self.branch_hash
    hash = {}

    branches = Branch.all
    branches.each do |branch|
      if branch.parent
        hash[branch.parent.name] = {}
        hash[branch.parent.name][branch.name] = {}
      end
    end

    hash
  end
end
