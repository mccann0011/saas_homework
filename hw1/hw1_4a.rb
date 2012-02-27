# Create a class Dessert with getters and setters for name and calories. Define instance 
# methods healthy?, which returns true if a dessert has less than 200 calories, and delicious?, 
# which returns true for all desserts.

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

if __FILE__ == $0
    d = Dessert.new("Sundae", 250)
    
    puts "Name      : #{d.name}"
    puts "Calories  : #{d.calories}"
    puts "Healthy?  : #{d.healthy?}"
    puts "Delicious : #{d.delicious?}"
end
