# Write a method that determines whether a given word or phrase is a palindrome, that is, it 
# reads the same backwards as forwards, ignoring case, punctuation, and nonword characters. (a 
# "nonword character" is defined for our purposes as "a character that Ruby regexps would treat as 
# a nonword character".) Your solution shouldn't use loops or iteration of any kind. You will find
# regular-expression syntax very useful; it's reviewed briefly in the book, and the website 
# rubular.com lets you try out Ruby regular expressions "live". Methods you might find useful 
# (which you'll have to look up in Ruby documentation, ruby-doc.org) include: String#downcase, 
# String#gsub, String#reverse

# Suggestion: once you have your code working, consider making it more beautiful by using 
# techniques like method chaining, as described in ELLS 3.2.

def palindrome?(string)
   s = string.downcase.gsub(/\W/, "")
   return (s == s.reverse)
end

if __FILE__ == $0
   string = "A man, a plan, a canal -- Panama"
   puts string
   puts palindrome?(string) 
   #=> true 

   string = "Madam, I'm Adam!"
   puts string
   puts palindrome?(string) 
   # => true 

   string = "Abracadabra"
   puts string
   puts palindrome?(string) 
   # => false (nil is also ok)
end
