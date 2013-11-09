require "pry"
class FiveCardHand
  include Pair
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def type
    types.each do |t|
      return t if self.send((t.to_s + "?").to_sym)
    end
    :high_card
  end

  def compare_duplicate_cards(type, other_hand)
    self_rank = CardOrder.sort_index(summary[type].first.number)
    other_rank = CardOrder.sort_index(other_hand.summary[type].first.number)
    return if self_rank == other_rank
    self_rank > other_rank ? self : other_hand
  end

  def compare_kickers(other_hand)
    other_kickers = other_hand.kickers
    kickers.each_with_index do |card, index|
      other_card = other_kickers[index]
      next if card.number == other_card.number
      return CardOrder.sort_index(card.number) > CardOrder.sort_index(other_card.number) ? self : other_hand
    end
  end

  def kickers
    CardOrder.sort_best_to_worst(summary[:kickers])
  end

  def grouped_cards
    card_numbers = cards.map(&:number)
    cards.group_by { |c| card_numbers.count(c.number) }
  end

  def count_mapping
    { 3 => :three_of_a_kind, 4 => :four_of_a_kind, 1 => :kickers }
  end

  def summary
    result = {}
    grouped_cards.each do |count, cards|
      if count == 2
        result.merge!(PairAnalyzer.summary(cards))
      else
        result[count_mapping[count]] = cards
      end
    end
    result
  end

  def pair?
    unique_number_counts.values.any? { |count| count == 2 }
  end

  def two_pair?
    unique_number_counts.values.count(2) == 2
  end

  def three_of_a_kind?
    unique_number_counts.values.any? { |count| count == 3 }
  end

  def four_of_a_kind?
    unique_number_counts.values.any? { |count| count == 4 }
  end

  def full_house?
    pair? && three_of_a_kind?
  end

  def flush?
    cards.all? { |c| c.suit == cards.first.suit }
  end

  def straight?
    possible_straights.any? { |ps| ps == card_numbers.sort }
  end

  def straight_flush?
    straight? && flush?
  end

  private

  def types
    [
      :straight_flush,
      :four_of_a_kind,
      :full_house,
      :flush,
      :straight,
      :three_of_a_kind,
      :two_pair,
      :pair
    ]
  end

  def possible_straights
    numbers = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
    numbers.each_cons(5).map { |numbers| numbers.sort }
  end

  def card_numbers
    cards.map(&:number)
  end

  def unique_number_counts
    card_numbers.uniq.inject({}) do |memo, number|
      memo[number] = card_numbers.count(number)
      memo
    end
  end

end
