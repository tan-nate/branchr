class Branch < ActiveRecord::Base
  belongs_to :tree
  has_many :children, class_name: "Branch", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Branch"

  def self.origin
    branches = Branch.all
    branches.find do |branch|
      branch if !branch.parent
    end
  end

  def self.branch_hash
    hash = {}
    origin = Branch.origin

    hash[origin] = {}
    origin.children.each do |child|
      hash[origin][child] = {}
      child.children.each do |grandchild|
        hash[origin][child][grandchild] = {}
      end
    end

    hash
  end
end
