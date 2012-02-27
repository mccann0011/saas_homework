# Given a string of input, return a hash whose keys are words in the string and whose values 
# are the number of times each word appears. Don't use for-loops. Nonwords should be ignored. Case 
# shouldn't matter. A word is defined as a string of characters between word boundaries. (Hint: the 
# sequence \b in a Ruby regexp means "word boundary".)

def count_words(string) 
   # your code here
end

if __FILE__ == $0
   count_words("A man, a plan, a canal -- Panama")
   # => {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}

   count_words "Doo bee doo bee doo" 
   # => {'doo' => 3, 'bee' => 2}
end