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

  ## taken from https://github.com/stefankroes/ancestry/blob/master/lib/ancestry/class_methods.rb
  def self.arrange_nodes(nodes)
    node_ids = Set.new(nodes.map(&:id))
    index = Hash.new { |h, k| h[k] = {} }

    nodes.each_with_object({}) do |node, arranged|
      children = index[node.id]
      index[node.parent_id][node] = children
      arranged[node] = children unless node_ids.include?(node.parent_id)
    end
  end
end
