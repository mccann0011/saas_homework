class CartesianProduct
  include Enumerable
  
  def initialize(seq1, seq2)
    print "Initialize begin\n"
    # Compute the product
    i = 0

    @prod = []
    seq1.each do |s1|
       seq2.each do |s2|
          @prod[i] = [s1, s2]
          puts "[#{s1},#{s2}]"
          i = i + 1
       end
    end
    puts "Product is ", @prod, "\n"
    print "Initialize complete\n"
  end
  
  # implement each method
  def each
    index = 0
    self.each do |elt|
      yield elt
      index += 1
    end
  end

  # implement inspect method
end

if __FILE__ == $0
    # [:a, :b] means a sequence containing two symbols (:a means symbol a)
    c = CartesianProduct.new([:a,:b], [4,5])
    c.each { |elt| puts elt.inspect }
    # [:a, 4]
    # [:a, 5]
    # [:b, 4]
    # [:b, 5]
    
    c = CartesianProduct.new([:a,:b], [])
    c.each { |elt| puts elt.inspect }
    # (nothing printed since Cartesian product
    # of anything with an empty collection is empty)
end
