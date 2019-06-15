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

  # taken from https://stackoverflow.com/questions/4588196/turn-a-ruby-hash-into-html-list
  def self.hash_to_html key,value
    if value.nil?
      puts "<li>#{key}</li>"
    elsif value.is_a?(Hash)
      puts "<li>#{key}"
      puts "<ul>"
     value.each(&method(:hash_to_html))
      puts "</ul></li>"
    else
      fail "I don't know what to do with a #{value.class}"
    end
  end
end
