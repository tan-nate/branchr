class Lister
  def self.name(branch)
    branch.name
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

  # from https://stackoverflow.com/questions/8748475/iterate-over-a-deeply-nested-level-of-hashes-in-ruby/21432969
  def self.save_pair(parent, myHash)
    myHash.each {|key, value|
      value.is_a?(Hash) ? save_pair(key, value) :
              puts("parent=#{parent.nil? ? 'none':parent}, (#{key}, #{value})")
    }
  end

  def self.list(branches)
    arranged = self.arrange_nodes(branches)
    arranged.to_html
  end
end
