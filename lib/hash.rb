class Hash
  # from https://gist.github.com/chastell/1196800
  def to_html
    [
      '<ul class="tree">',
      map { |k, v| ["<li><strong>#{k.name}</strong>", v.respond_to?(:to_html) ? v.to_html : "<span>#{v.name}</span></li>"] },
      '</ul>'
    ].join
  end

  def foo
    "foo"
  end
end
