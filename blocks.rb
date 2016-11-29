def reduce(array, start=0)
  counter = 0
  sum = start
  
  while counter < array.size
    sum = yield(sum, array[counter])
    counter += 1
  end

  sum                                          
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num } 
p reduce(array, 10) { |acc, num| acc + num }


