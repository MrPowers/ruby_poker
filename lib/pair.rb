module Pair
  def pair_number
    numbers = cards.map(&:number)
    numbers.each_with_index { |number, index| return number if numbers[(index + 1)..-1].include?(number) }
  end

  def pair_kickers
    kicker_cards = cards.select { |card| card.number != pair_number }
    sort_best_to_worst(kicker_cards)
  end
end
