# Exercises
class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim"
  end
end

class Cat < Dog
  def swim
    "can't swim"
  end

  def fetch
    "can't fetch"
  end
end

karl = Bulldog.new
puts karl.speak           # => "bark!"
puts karl.swim 