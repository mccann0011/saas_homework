class CartesianProduct
  include Enumerable
  
  def initialize(seq1, seq2)
    @common = [] ; seq1.each {|n| seq2.each {|l| @common << [n, l]}}
  end
  
  def each
    index = 0
    while index < @common.size
      yield @common[index]
      index += 1
    end
  end
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
