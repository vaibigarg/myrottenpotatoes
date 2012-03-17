class Array
  def each_with_flattening
    flatArray = Array.new
    self.each  do |obj|
#puts "obj: " + obj.to_s 
      if obj.is_a?Array
        obj.each_with_flattening { |s| flatArray << s}
      else 
          flatArray << obj
      end
    end
    flatArray.each {|s| yield s}
  end

end

[1,[2,3],4,[[5,6],7]].each_with_flattening { |s| print "#{s},"}

