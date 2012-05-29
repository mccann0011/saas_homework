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

class Numeric
   @@currencies = {'dollar' => 1.0, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
   
   def method_missing(method_id)
      singular_currency = method_id.to_s.gsub( /s$/, '')
      # puts "Numeric::MethodMissing " + singular_currency
      if @@currencies.has_key?(singular_currency)
         #Currency.new(singular_currency, self * @@currencies[singular_currency])
         Currency.new(singular_currency, self)
      else
         super
      end
   end      
end

class Currency
   @@currencies = {'dollar' => 1.0, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}

   def initialize
      @currency = 'dollar'
      @value    = 0.0
   end

   def initialize(currency, value)
      @currency = currency
      @value    = value
   end
   
   def in(new_currency)
      #puts "My value is    " + @value.to_s()
      #puts "My currency is " + @currency

      singular_currency = new_currency.to_s.gsub( /s$/, '')
      #puts "Converting to  " + singular_currency.to_s()
      
      if @@currencies.has_key?(singular_currency)
         # Convert from current currency to dollars
         #puts @value
         value = @value * @@currencies[@currency]
         #puts value

         # Convert from dollars to new currency
         value = value / @@currencies[singular_currency]
         #puts value
      else
         value = 0.0
      end
      
      return value
   end
   
   def to_s()
      return @value.to_s() + " " + @currency
   end
end

class String
   def palindrome?
      s = self.downcase.gsub(/\W/, "")
      return (s == s.reverse)
   end
end

class Object
   def palindrome?
      puts "*** " + self.class.to_s() + " ***"
      if self.respond_to?("reverse")
         #puts "Responds to reverse()"
         r = self
         result = (self == r.reverse)
      else
         result = false
      end
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

#a) [ELLS ex. 3.11] Extend the currency-conversion example from lecture so that you can write
#5.dollars.in(:euros), 10.euros.in(:rupees)
# You should support the currencies 'dollars', 'euros', 'rupees' , 'yen' where the
#conversions are: rupees to dollars, multiply by 0.019; yen to dollars, multiply by 0.013;
#euro to dollars, multiply by 1.292.
# Both the singular and plural forms of each currency should be acceptable, e.g.
#1.dollar.in(:rupees) and 10.rupees.in(:euro) should work.

   print "\n===== Test Case 4a\n"
   balance = 20.00
   puts "Dollars " + balance.dollars.to_s()
   puts "Euros   " + balance.euros.to_s()
   puts "Yen     " + balance.yen.to_s()
   puts "Rupee   " + balance.rupees.to_s()

   puts "5 dollars = " + 5.dollars.in(:euros).to_s()
   puts "10 euros  = " + 10.euros.in(:rupees).to_s()
   
   puts 2.rupee.in(:dollar)
   # between?(0.037, 0.039)
   puts 3.yen.in(:dollar)
   # between?(0.038, 0.040)
   puts 6.euro.in(:dollar)
   # between?(7.75, 7.76)
   puts 2.rupees.in(:dollars)
   # between?(0.037, 0.039)
   puts 3.yen.in(:dollars)
   # between?(0.038, 0.040)
   puts 6.euros.in(:dollars)
   # between?(7.75, 7.76)
   puts 5.rupees.in(:yen)
   # between?(7.2, 7.4)
   
# b) Adapt your solution from the "palindromes" question so that instead of writing palindrome?
# ("foo") you can write "foo".palindrome? HINT: this should require fewer than 5 lines
# of code.

   print "\n===== Test Case 4b\n"
   puts "foo".palindrome?
   puts "Madam, I'm Adam!".palindrome?

# c) Adapt your palindrome solution so that it works on Enumerables. That is:
# [1,2,3,2,1].palindrome?
# => true
# (It's not necessary for the collection's elements to be palindromes themselves--only that the
# top-level collection be a palindrome.) HINT: this should require fewer than 5 lines of code.
# Although hashes are considered Enumerables, your solution does not need to make sense for
# hashes (though it should not error).

   print "\n===== Test Case 4c\n"
   puts [1,2,3,4,5].palindrome?
   puts [1,2,3,2,1].palindrome?

   pvalue = {"hello"=> "world"}.palindrome?
   puts pvalue
   
   (1..2).palindrome?
   
end
