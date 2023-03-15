class Fruits
  def red
    puts "りんご"
  end
end

class Vegetables < Fruits
  def red
    super
    puts "トマト"
  end
end

fruit = Fruits.new
fruit.red

vegetables = Vegetables.new
vegetables.red
