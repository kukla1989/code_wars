#https://www.codewars.com/kata/529bf0e9bdf7657179000008/ruby
# Write a function validSolution() that accepts
# a 2D array representing a Sudoku board, and returns true if it is a valid solution,
# or false otherwise. The cells of the sudoku board may also contain 0's, which will
# represent empty cells. Boards containing one or more zeroes are considered to be invalid solutions.
def find_zero(board)
  res = false
  board.each do |arr|
    arr.each{|el| res = true if el == 0}
  end
  res
end


def validSolution(board)
  result = true
  return false if find_zero board
  arr = []
  #check every 3x3 box
  i = 0
  while i < 7 do
    (0..8).each_with_index{|j|
      if j == 3 || j == 6
        result = false unless arr.length == arr.uniq.length
        arr = []
      end
      arr.push(*board[j][i..i + 2])
    }
    result = false unless arr.length == arr.uniq.length
    arr = []
    i += 3
  end
  #check every column
  for i in 0.. 8 do
    for j in 0..8 do
      arr.push board[j][i]
    end
    result = false unless arr.length == arr.uniq.length
    arr = []
  end
  #check every row
  board.each{|arr| result = false unless arr.length == arr.uniq.length} #(1..9).each{|i| result = false unless arr.include? i }
  result
end

print validSolution([[5, 3, 4, 6, 7, 8, 9, 1, 2],
                     [6, 7, 2, 1, 9, 5, 3, 4, 8],
                     [1, 9, 8, 3, 4, 2, 5, 6, 7],
                     [8, 5, 9, 7, 6, 1, 4, 2, 3],
                     [4, 2, 6, 8, 5, 3, 7, 9, 1],
                     [7, 1, 3, 9, 2, 4, 8, 5, 6],
                     [9, 6, 1, 5, 3, 7, 2, 8, 4],
                     [2, 8, 7, 4, 1, 9, 6, 3, 9],
                     [3, 4, 5, 2, 8, 6, 1, 7, 9]])
p ' - false?'
print validSolution([[5, 3, 4, 6, 7, 8, 9, 1, 2],
                     [6, 7, 2, 1, 9, 5, 3, 4, 8],
                     [1, 9, 8, 3, 4, 2, 5, 6, 7],
                     [8, 5, 9, 7, 6, 1, 4, 2, 3],
                     [4, 2, 6, 8, 5, 3, 7, 9, 1],
                     [7, 1, 3, 9, 2, 4, 8, 5, 6],
                     [9, 6, 1, 5, 3, 7, 2, 8, 4],
                     [2, 8, 7, 4, 1, 9, 6, 3, 5],
                     [3, 4, 5, 2, 8, 6, 1, 7, 9]])
p ' - true?'
print validSolution([[5, 3, 4, 6, 7, 8, 9, 1, 0],
                     [6, 7, 2, 1, 9, 5, 3, 4, 8],
                     [1, 9, 8, 3, 4, 2, 5, 6, 7],
                     [8, 5, 9, 7, 6, 1, 4, 2, 3],
                     [4, 2, 6, 8, 5, 3, 7, 9, 1],
                     [7, 1, 3, 9, 2, 4, 8, 5, 6],
                     [9, 6, 1, 5, 3, 7, 2, 8, 4],
                     [2, 8, 7, 4, 1, 9, 6, 3, 5],
                     [3, 4, 5, 2, 8, 6, 1, 7, 9]])
p ' - false?'

print validSolution([[5, 3, 4, 6, 7, 8, 9, 1, 1],
                     [6, 7, 2, 1, 9, 5, 3, 4, 8],
                     [1, 9, 8, 3, 4, 2, 5, 6, 7],
                     [8, 5, 9, 7, 6, 1, 4, 2, 3],
                     [4, 2, 6, 8, 5, 3, 7, 9, 1],
                     [7, 1, 3, 9, 2, 4, 8, 5, 6],
                     [9, 6, 1, 5, 3, 7, 2, 8, 4],
                     [2, 8, 7, 4, 1, 9, 6, 3, 5],
                     [3, 4, 5, 2, 8, 6, 1, 7, 9]])
p ' - false?'