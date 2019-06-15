class Hash
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
