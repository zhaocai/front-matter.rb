class Array 
  def unindent
    indent = select {|line| !line.strip.empty? }.map {|line| line.index(/[^\s]/) }.compact.min || 0
    map {|line| line.gsub(/^[[:blank:]]{#{indent}}/, '')}
  end

end

