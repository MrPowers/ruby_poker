class FiveCardHand
  include Pair
  attr_reader :cards
  def initialize(cards)
    @cards = cards
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

  def ranking
    hand_rankings.keys.each do |hand_type|
      return hand_rankings[hand_type] if self.send(hand_type)
    end
    hand_rankings[:high_card?]
  end

  private

  def hand_rankings
    {
      straight_flush?: 1,
      four_of_a_kind?: 2,
      full_house?: 3,
      flush?: 4,
      straight?: 5,
      three_of_a_kind?: 6,
      two_pair?: 7,
      pair?: 8,
      high_card?: 9
    }
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
