def getSuper(obj)
@x = obj
if obj.respond_to?(:class)
  @x = obj.class
end


while @x != nil do
    puts @x.to_s
    @x = @x.superclass
 end
end

getSuper 5
