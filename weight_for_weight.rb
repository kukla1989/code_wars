#https://www.codewars.com/kata/55c6126177c9441a570000cc/train/ruby
 require "test/unit/assertions"
 include Test::Unit::Assertions

def order_weight(string)
  string_arr = string.split
  weight_arr = string.split.map{ |el| find_weight(el) }
  res = []
  weight_arr_sorted = weight_arr.sort
  weight_arr_tmp = weight_arr.dup
  weight_arr_sorted.each do |el|
    index = weight_arr_tmp.find_index el
    res << string_arr[index]
    weight_arr_tmp[index] = nil  #so res will not have duplicate of the same value
  end
  #tally is standart mehtod for ruby >= 2.7 but for this cata only allowed 2.5
  # its return hash with key as each uniq element and value as count of this element
  same_weight = tally(weight_arr_sorted).select{ |key, count| count > 1}
  same_weight.each do |weight, count|
    ind = weight_arr_sorted.find_index weight
    res = res.slice(0, ind) + res.slice(ind, count).sort + res.slice((ind + count)..-1)
  end
  res.join(" ")
end

def tally(arr)
  res = Hash.new(0)
  arr.each{ |el| res[el] += 1}
  res
end

def find_weight(str)
  weight = 0
  str.size.times do |i|
    weight += str[i].to_i
  end
  weight
end

assert_equal(order_weight("103 123 4444 99 2000"), "2000 103 123 4444 99")
assert_equal(order_weight("2001 10003 1234000 44444444 9999 11 11 22 123"), "11 11 2001 10003 22 123 1234000 44444444 9999")
