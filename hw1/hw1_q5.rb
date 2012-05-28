# (Exercise 3.4 from ELLS)

# In lecture we saw how attr_accessor uses metaprogramming to create getters and setters for object 
# attributes on the fly.

# Define a method attr_accessor_with_history that provides the same functionality as attr accessor 
# but also tracks every value the attribute has ever had:

# We'll start you off. The first thing to notice is that if we define attr_accessor_with_history in 
# class Class, we can use it as in the snippet above. This is because, as ELLS mentions, in Ruby a 
# class is simply an object of class Class. (If that makes your brain hurt, just don't worry about 
# it for now. It'll come.) The second thing to notice is that Ruby provides a method class_eval that 
# takes a string and evaluates it in the context of the current class, that is, the class from which 
# you're calling attr_accessor_with_history. This string will need to contain a method definition 
# that implements a setter-with-history for the desired attribute attr_name.

# • Don't forget that the very first time the attribute receives a value, its history array will 
#   have to be initialized.
# • Don't forget that instance variables are referred to as @bar within getters and setters, as 
#   Section 3.4 of ELLS explains.
# • Although the existing attr_accessor can handle multiple arguments (e.g. attr_accessor :foo, 
#   :bar), your version just needs to handle a single argument.
# • Your implementation should be genreal enough to work in the context of any class and for 
#   attributes of any (legal) variable name
# • History of instance variables should be maintained separately for each object instance. that 
#   is, if you do
#       f = Foo.new
#       f.bar = 1
#       f.bar = 2
#       f = Foo.new
#       f. bar = 4
#       f.bar_history
#    then the last line should just return [nil,4], rather than [nil,1,2,4]

class Class
   def attr_accessor_with_history(attr_name)
      # make sure it's a string
      attr_name = attr_name.to_s 

      # create the attribute's setter
      class_eval %{def #{attr_name}= (val)
        @#{attr_name} = val
        if @#{attr_name+"_history"} == nil
           @#{attr_name+"_history"} = [nil]
        end

        list = @#{attr_name+"_history"}
        list << val
        @#{attr_name+"_history"} = list
      end}
      
      # create the attribute's getter
      attr_reader attr_name
         
      # create attribute's history getter
      attr_reader attr_name+"_history" 
   end
end

class Foo 
   attr_accessor_with_history :bar
end

if __FILE__ == $0

   print "\n===== Test Case 1\n"
   f = Foo.new 
   f.bar = 1
   f.bar = 2
   h = f.bar_history 
   print h.inspect + "\n"
   # => if your code works, should be [nil,1,2]
   
   print "\n===== Test Case 2\n"
   f = Foo.new 
   f.bar = 3
   f.bar = :wowzo 
   f.bar = 'boo!' 
   h = f.bar_history 
   print h.inspect + "\n"
   #=> [nil, 3, :wowzo, 'boo!']

   print "\n===== Test Case 3\n"
   f = Foo.new
   f.bar = 1
   f.bar = 2
   f = Foo.new
   f. bar = 4
   h = f.bar_history
   print h.inspect + "\n"
   # should just return [nil,4], rather than [nil,1,2,4]

end

