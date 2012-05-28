def palindrome?(string)
   s = string.downcase.gsub(/\W/, "")
   return (s == s.reverse)
end

def count_words(string)
   words = string.downcase.scan(/[a-zA-Z]+\b/)
   count = {}
   words.each{ |key| if (count[key] == nil) then count[key] = 1 else count[key] += 1 end}
   return count
end

puts "Testing"
string = "A man, a plan, a canal -- Panama"
if palindrome?(string) == true
    puts "Success", string
else
    puts "Incorrect", string
end

string = "Madam, I'm Adam!"
if palindrome?(string) == true
    puts "Success", string
else
    puts "Incorrect", string
end

string = "Abracadabra"
if palindrome?(string) == false
    puts "Success", string
else
    puts "Incorrect", string
end

count = count_words("A man, a plan, a canal -- Panama")
puts count
# => {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}

count = count_words "Doo bee doo bee doo"  
puts count
# => {'doo' => 3, 'bee' => 2}