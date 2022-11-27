#https://www.codewars.com/kata/51edd51599a189fe7f000015/ruby
#Complete the function that
# =>accepts two integer arrays of equal length
# =>compares the value each member in one array to the corresponding member in the other
# =>squares the absolute value difference between those two values
# =>and returns the average of those squared absolute value difference between each member pair.

def solution1 (arr1, arr2)
  res = []
  for i in 0..(arr1.size - 1) do
    if arr1[i] > arr2[i]
      if arr1[i] < 0   # a1 > a2, both negative   
        res.push(arr1[i] - arr2[i])
      elsif arr2[i] < 0 # a1 > a2, a2 < 0
        res.push(arr1[i] - arr2[i])
      else            # a1 > a2
        res.push(arr1[i] - arr2[i])
      end
    else
      if arr2[i] < 0  # a1 < a2, both negative
        res.push(arr2[i] - arr1[i])
      elsif arr1[i] < 0 # a1 < a2, a1 < 0
        res.push(arr2[i] - arr1[i])
      else            # a1 < a2
        res.push(arr2[i] - arr1[i])
      end
    end
  end
  res.map{ |el| el**2 }.inject(0, :+) / (0.0 + arr1.size)
end

def solution (arr1, arr2)
  arr1.map.with_index{ |v, i| (v - arr2[i])**2 }.sum.fdiv(arr1.size)
end



p solution([1, 2, 3], [4, 5, 6])
p 9
p solution([10, 20, 10, 2], [10, 25, 5, -2])
p 16.5
