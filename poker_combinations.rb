require "test/unit/assertions"
include Test::Unit::Assertions


class PokerHand
  attr_reader :hand
  attr_reader :order

  def initialize(hand)
    @hand = hand.split(" ")
    find_order
  end


  def compare_with(other_player)
    if @order < other_player.order
      return "Win"
    elsif @order > other_player.order
      return "Loss"
    elsif @order == other_player.order
      return higher(other_player.arr_hand())
    end
  end


  def higher(arr_hand_o)
    arr_hand = arr_hand()
    if @order == 8 # if pair find higher pair not higher card in hand
      pair = arr_hand.find {|el| arr_hand.count(el) > 1 }
      pair_o = arr_hand_o.find { |el| arr_hand_o.count(el) > 1}
      if pair > pair_o
        return "Win"
      elsif pair < pair_o
        return "Loss"
      end
    end
    return "Tie" if arr_hand.sort == arr_hand_o.sort
    arr_hand1 = arr_hand - arr_hand_o
    arr_hand_o1 = arr_hand_o - arr_hand
    return "Loss" if arr_hand1 == []  # probably it meaningless
    return "Win" if arr_hand_o1 == [] # probably it meaningless
    if arr_hand1.max > arr_hand_o1.max
      return "Win"
    else
      return "Loss"
    end
  end

  def highest
    arr_hand.max
  end


  def find_order
    arr_hand = arr_hand()
    if flush? && consist?(arr_hand)
      if arr_hand.last == 14
        @order = 0
      else
        @order = 1
      end
      return
    end
    if kare?(arr_hand)
      @order = 2
      elsif full_house?(arr_hand)
      @order = 3
    elsif flush?
      @order = 4
    elsif consist?(arr_hand)
      @order = 5
    elsif arr_hand.select { |el| arr_hand.sort[2] == el }.length == 3 #find three of a kind
      @order = 6
    elsif arr_hand.uniq.length == 3 #find two pair
      @order = 7
    elsif arr_hand.uniq.length == 4
      @order = 8
    else
      @order = 9
    end
  end

  def flush?
    @hand.map { |el| el[1] }.uniq.length == 1
  end
  def full_house?(a)
    b = a.select { |el| a[2] == el } # b is triple for example[2, 2, 2]
    c = a - b                        # c is pair
    c.length == 2 && b.length == 3 && c.uniq.length == 1
  end


  def kare?(a)
    a.sort!
    true if a[1] == a[2] && a[2] == a[3] && (a[0] == a[1] || a[3] == a[4])
  end

  def consist?(arr)
    arr = arr.sort
    a = [arr[0]]
    4.times{ |i| a << (arr[0] + 1 + i) }
    arr == a
  end

  def arr_hand
    @hand.map { |el| "__23456789TJQKA".index(el[0]) }.sort
  end
end


p2 = PokerHand.new("3D 2H 3H 2C 2D")
p1 = PokerHand.new("8C 9C 5C 3C TC")
print p1.compare_with(p2)
p "-- loss?"

player = PokerHand.new("KH QH JH TH AH")
print player.order
p " == 1?"
player = PokerHand.new("2H 3H 4H 6H 5H")
print player.order
p " == 2?"
player = PokerHand.new("2H 3H 3H 3H 3H")
print player.order
p ' == 3?'
player = PokerHand.new("2H 2H 3H 3H 3H")
print player.order
p ' == 4?'
player = PokerHand.new("2H 3D 4S 6H 5H")
print player.order
p ' == 5?'
player = PokerHand.new("2H 2D 4S 2H 5H")
print player.order
p ' == 6?'
player = PokerHand.new("2H 2D 4S 4H 5H")
print player.order
p ' == 7?'      # two pair
player = PokerHand.new("2H 3D 4S 4H AH")
print player.order
p ' == 8?'
print player.highest
p " == 14?"
p1 = PokerHand.new("2H 3H 4H 5H 6H")
p2 = PokerHand.new("KS AS TS QS JS")
print p1.compare_with(p2)
p "-- Loss?"
p1 = PokerHand.new("6S AD 7H 4S AS")
p2 = PokerHand.new("AH AC 5H 6H 7S")
print p1.compare_with(p2)
p "-- Loss?"



def runTest(msg, expected, hand, other)
  player, opponent = PokerHand.new(hand), PokerHand.new(other)
  assert_equal(player.compare_with(opponent), expected, "#{msg}: '#{hand}' against '#{other}'")
end

runTest("Highest straight flush wins",        "Loss", "2H 3H 4H 5H 6H", "KS AS TS QS JS")
runTest("Straight flush wins of 4 of a kind", "Win",  "2H 3H 4H 5H 6H", "AS AD AC AH JD")
runTest("Highest 4 of a kind wins",           "Win",  "AS AH 2H AD AC", "JS JD JC JH 3D")
runTest("4 Of a kind wins of full house",     "Loss", "2S AH 2H AS AC", "JS JD JC JH AD")
runTest("Full house wins of flush",           "Win",  "2S AH 2H AS AC", "2H 3H 5H 6H 7H")
runTest("Highest flush wins",                 "Win",  "AS 3S 4S 8S 2S", "2H 3H 5H 6H 7H")
runTest("Flush wins of straight",             "Win",  "2H 3H 5H 6H 7H", "2S 3H 4H 5S 6C")
runTest("Equal straight is tie", 	  	        "Tie",  "2S 3H 4H 5S 6C", "3D 4C 5H 6H 2S")
runTest("Straight wins of three of a kind",   "Win",  "2S 3H 4H 5S 6C", "AH AC 5H 6H AS")
runTest("3 Of a kind wins of two pair",       "Loss", "2S 2H 4H 5S 4C", "AH AC 5H 6H AS")
runTest("2 Pair wins of pair",                "Win",  "2S 2H 4H 5S 4C", "AH AC 5H 6H 7S")
runTest("Highest pair wins",                  "Loss", "6S AD 7H 4S AS", "AH AC 5H 6H 7S")
runTest("Pair wins of nothing",               "Loss", "2S AH 4H 5S KC", "AH AC 5H 6H 7S")
runTest("Highest card loses",                 "Loss", "2S 3H 6H 7S 9C", "7H 3C TH 6H 9S")
runTest("Highest card wins",                  "Win",  "4S 5H 6H TS AC", "3S 5H 6H TS AC")
runTest("Equal cards is tie",		              "Tie",  "2S AH 4H 5S 6C", "AD 4C 5H 6H 2C")
