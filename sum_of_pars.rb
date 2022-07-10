#https://www.codewars.com/kata/54d81488b981293527000c8f/train/ruby
def sum_pairs(ints, s)
  switch = true
  i = 0
  while switch do
    ints.each_with_index do |val, ind|
      if (ints[i]  + val) == s && i != ind && ints[i] != val
        return [ints[i], ints[ind]]
      end
    end
    i += 1
    switch = false if (i == ints.size)
  end

end

p sum_pairs([1, 4, 8, 7, 3, 15], 8)
p sum_pairs([1, -2, 3, 0, -6, 1], -6)
p sum_pairs([10, 5, 2, 3, 7, 5], 10)