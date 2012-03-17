require 'enumerator'
class FibSequence
include Enumerable
def initialize (val)
  @fibArray = Array[1]
  raise 'Incorrect Val' unless val >= 1
  (val-1).times do
    val = 1  
    if @fibArray.length > 1
      val = @fibArray[@fibArray.length-1]+ @fibArray[@fibArray.length-2] 
    end
   @fibArray <<  val


  end
end

def each
  @fibArray.each {|s| yield s} 
end


end







f = FibSequence.new(6)
f.each {|s| print(s,':') }
puts (f.reject { |s| s.odd?}).inspect
#f.reject (&:odd?)
puts (f.map {|x| 2*x }).inspect
FibSequence.new(3) do; print "Rah" end

