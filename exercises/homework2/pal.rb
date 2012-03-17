class String
  def palindrome?
    temp = self.downcase.gsub("[a..zA..Z]")
    puts temp
  end
end

"Madam I'm adam".palindrome?

