class Lister
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

  def self.list(branches)
    arranged = self.arrange_nodes(branches)
    arranged.to_html
  end
end
