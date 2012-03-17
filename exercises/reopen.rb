class Fixnum
   def seconds; self ;end
   def minutes; self * 60 ; end
   def hours; self * 60 *60 ; end
   def day; self * 60 * 60 * 24; end
   def ago; Time.now - self; end
   def from_now; Time.now + self; end
   def method_missing(method_id, *args)
      name = method_id.to_s
      if name =~ /^hour|second|minute$/
         self.send(name + 's')
      else
        super
      end
  end
end


class Time
  def at_beginning_of_year
    Time.local(self.year)    
  end
end


puts Time.now
puts 5.seconds
puts 5.minutes
puts 5.minutes - 4.minutes
puts 5.hours.from_now
puts 5.minute
puts 5.day
puts Time.now.at_beginning_of_year + 1.day

