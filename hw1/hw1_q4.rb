# Create a class Dessert with getters and setters for name and calories. Define instance 
# methods healthy?, which returns true if a dessert has less than 200 calories, and delicious?, 
# which returns true for all desserts.

# Create a class JellyBean that extends Dessert, and add a getter and setter for flavor. 
# Modify delicious? to return false if the flavor is black licorice (but delicious? should still 
# return true for all other flavors and for all non-JellyBean desserts).

class Dessert

    attr_accessor :name
    attr_accessor :calories
    
    def initialize(name, calories)
        @name = name
        @calories = calories
    end
    
    def healthy?
        @calories < 200
    end
    
    def delicious?
        true
    end
end

class JellyBean < Dessert

    attr_accessor :flavor
    
    def initialize(name, calories, flavor)
        @flavor = flavor
        super(name, calories)
    end
    
    def delicious?
        if @flavor == "black licorice"
           return false
        else
           return true
        end
    end
end

if __FILE__ == $0
    d = Dessert.new("Sundae", 250)
    puts "---------------------------"
    puts d.inspect
    puts "Name      : #{d.name}"
    puts "Calories  : #{d.calories}"
    puts "Healthy?  : #{d.healthy?}"
    puts "Delicious : #{d.delicious?}"

    j1 = JellyBean.new("JellyBean", 20, "strawberry")
    puts "---------------------------"
    puts j1.inspect
    puts "Name      : #{j1.name}"
    puts "Calories  : #{j1.calories}"
    puts "Flavor    : #{j1.flavor}"
    puts "Healthy?  : #{j1.healthy?}"
    puts "Delicious : #{j1.delicious?}"

    j2 = JellyBean.new("JellyBean", 25, "black licorice")
    puts "---------------------------"
    puts j2.inspect
    puts "Name      : #{j2.name}"
    puts "Calories  : #{j2.calories}"
    puts "Flavor    : #{j2.flavor}"
    puts "Healthy?  : #{j2.healthy?}"
    puts "Delicious : #{j2.delicious?}"

    puts "---------------------------"
end
