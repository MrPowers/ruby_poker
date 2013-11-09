class Showdown
  include CardOrder
  attr_reader :hand1, :hand2
  def initialize(hand1, hand2)
    @hand1 = hand1
    @hand2 = hand2
  end

  def winning_hand
    hand1.ranking < hand2.ranking ? hand1 : hand2
  end

  def best_pair
    sort_index(hand1.pair_number) < sort_index(hand2.pair_number) ? hand1 : hand2
  end

  def best_kicker
    hand2_kickers = hand2.kickers
    hand1.pair_kickers.each_with_index do |card, index|
      next if card.number == hand2_kickers[index].number
    end
  end
end
