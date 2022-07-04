#Most frequently used words in a text(first three)
#https://www.codewars.com/kata/51e056fe544cf36c410000fb/train/ruby

def text_to_array_of_words(text)
  word = ''
  words = []
  text.size.times do |i|
    if !text[i].match?(/[A-Za-z']/) && word != ''
      words.push word
      word = ''
    elsif text[i].match?(/[A-Za-z']/)
      word += text[i]
      words.push word if i == text.size - 1
    end
  end
  words
end

def top_3_words(text)
  words = text_to_array_of_words text
  words_hash = Hash.new(0)
  words.each { |word| words_hash[word] += 1 }

  words_sorted = words_hash.sort_by{ |k, v| -v }
  p '---------------------------------------------------'
  p words_sorted
  result = []
  result.push words_sorted[0][0] if words_sorted.size > 0
  result.push words_sorted[1][0] if words_sorted.size > 1
  result.push words_sorted[2][0] if words_sorted.size > 2
  result
end



p top_3_words "  , e   .. "
p 'e'
p top_3_words "a a a  b  c c  d d d d  e e e e e"
p ["e", "d", "a"]
p top_3_words "e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e"
p ["e", "ddd", "DDD"]
p top_3_words "  //wont won't won't "
p ["won't", "wont"]
p top_3_words "  , e   .. "
p top_3_words "  ...  "
p 'nope'
p top_3_words '""""In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.""""'
p ["a", "of", "on"]