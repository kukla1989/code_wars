#solution for task: Write a rotate function that rotates a two-dimensional array (a matrix) either clockwise or
# anti-clockwise by 90 degrees, and returns the rotated array.
# The function accepts two parameters: an array, and a string specifying the direction or rotation. The direction will be
# either "clockwise" or "counter-clockwise".
# https://www.codewars.com/kata/525a566985a9a47bc8000670/train/ruby
def rotate matrix, direction
  res = []
  tmp = []
  m_size = matrix.size - 1
  el_size = matrix.first.size - 1
  if direction == "counter-clockwise"
    for i in el_size.downto 0 do
      for j in 0..m_size do
        tmp.push matrix[j][i]
      end
      res.push tmp
      tmp = []
    end
  else
    for i in 0..el_size do
      for j in m_size.downto(0) do
        tmp.push matrix[j][i]
      end
      res.push tmp
      tmp = []
    end
  end
  res
end

matrix = [[1, 2, 3],
          [4, 5, 6],
          [7, 8, 9]]

p rotate(matrix, 'counter-clockwise')
puts "[[3,6,9],[2,5,8],[1,4,7]"
p rotate(matrix, "clockwise")
puts "[[7, 4, 1], [8, 5, 2],  [9, 6, 3]]"

