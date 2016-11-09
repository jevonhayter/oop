class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def speed_up(num)
    @current_speed += num
    puts "The car has speed up by #{num} mph"
  end

  def brake(num)
    @current_speed -= num
    puts "You just pressed the brakes by #{num} mph"
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_off
    puts "You shut off the car"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end
end

car = MyCar.new(2012, "black", "Hyundai")
puts car.color
puts car.color = "Blue"
puts car.year
puts car.spray_paint("red")
puts car.color