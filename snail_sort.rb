#https://www.codewars.com/kata/521c2db8ddc89b9b7a0000c1/
array = [[1,2,3],
         [8,9,4],
         [7,6,5]]
arr = [[1,  2,  3,  4],
       [12, 13, 14, 5],
       [11, 16, 15, 6],
       [10, 9,  8,  7]]



def snail(arr)
  res = []
  until arr.empty? do
    res += arr.shift
    res += arr.map(&:pop)
    res += arr.pop.reverse unless arr && arr == []
    res += arr.map(&:shift).reverse unless arr && arr == []
  end
  res
end



p snail(array) #=> [1,2,3,4,5,6,7,8,9]
p snail arr