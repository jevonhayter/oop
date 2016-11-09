module Hemi
  def engine
    "This vehicle has a Hemi engine."
  end
end

class Vehicle
  @@number_of_vehicles = 0

  attr_accessor :color
  attr_reader :year
  attr_accessor :model

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@number_of_vehicles += 1
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
    puts 'You shut off the car'
  end


  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def age
    "Your #{self.model} is #{years_old} years old."
  end

  private

  def years_old
    Time.now.year - self.year
  end
end

class MyTruck < Vehicle
  include Hemi
  NUMBER_OF_DOORS = 3

  def to_s
    "My truck is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end

  def to_s
    "My car is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

car = MyCar.new(2012, 'black', 'Hyundai')
truck = MyTruck.new(2013, 'white', 'Durango')
puts truck.engine

puts car.age

