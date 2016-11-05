class BallGame
  def points(buckets)
    buckets
  end

  def assists(dimes)
    dimes
  end

  def rebounds(boards)
    boards
  end

  def steals(theft)
    theft
  end

  def blocks(beats)
    beats
  end

  def turnovers(to)
    to
  end
end


class Baller < BallGame
  attr_accessor :name, :height, :weight, :first, :last, :points

  def initialize(name, height, weight)
    @names = name.split
    @first = @names.first
    @last = @names.last
    @name = name
    @height = height
    @weight = weight
  end

  def points(buckets)
    @points = buckets
  end
end


player = Baller.new('Lebron James', '6\'9', 279)
player1 = Baller.new('Kevin Durant', '7\'0', 250)



puts "#{player.name} had #{player.points(35)} points\
 and #{player.assists(10)} assists."

puts "#{player1.name} had #{player.points(45)} points\
 and #{player.assists(15)} assists." 

