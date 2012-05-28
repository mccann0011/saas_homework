# 2. iterators, blocks, yield
#
# Given two collections (of possibly different lengths), we want to get the Cartesian product of 
# the sequences—in other words, every possible pair of N elements where one element is drawn from 
# each collection.
#
# For example, the Cartesian product of the sequences a==[:a,:b,:c] and b==[4,5] is:
#    a×b == [[:a,4],[:a,5],[:b,4],[:b,5],[:c,4],[:c,5]]
#
# Create a method that accepts two sequences and returns an iterator that will yield the elements 
# of the Cartesian product, one at a time, as a two-element array.
#    It doesn't matter what order the elements are returned in. So for the above example, the 
#    ordering [[:a,4], [:b,4], [:c,4], [:a,5], [:b,5], [:c,5]] would be correct, as would any 
#    other ordering.
#
#    It does matter that within each pair, the order of the elements matches the order in which 
#    the original sequences were provided. That is, [:a,4] is a member of the
#    Cartesianproducta×b,but[4,:a]isnot. (Although[4,:a]isamemberofthe Cartesian product b×a.]
#
# To start you off, here is a code skeleton and some examples showing possible correct results.
#
# http://pastebin.com/cgSuhtPf

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
