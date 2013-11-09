require "pry"
class Showdown
  attr_reader :hand1, :hand2
  def initialize(hand1, hand2)
    @hand1 = hand1
    @hand2 = hand2
  end

  def winning_hand
    comparison = hand_rankings.keys.index(hand1.type) <=> hand_rankings.keys.index(hand2.type)
    return hand1 if comparison == -1
    return hand2 if comparison == 1
    tiebreaker
  end

  def tiebreaker
    return unless hand1.type == hand2.type
    hand_rankings[hand1.type].each do |differentiator|
      if differentiator_mapping[differentiator] == :highest_kicker
        next unless hand1.compare_kickers(hand2)
        return hand1.compare_kickers(hand2)
      elsif differentiator_mapping[differentiator] == :highest_card
        next unless hand1.compare_duplicate_cards(differentiator, hand2)
        return hand1.compare_duplicate_cards(differentiator, hand2)
      end
    end
    :draw
  end

  def ranking(hand)
    hand_rankings.keys.each do |hand_type|
      return hand_type if hand.send((hand_type.to_s + "?").to_sym)
    end
    :high_card
  end

  private

  def differentiator_mapping
    {
      :kickers => :highest_kicker,
      :four_of_a_kind => :highest_card,
      :three_of_a_kind => :highest_card,
      :pair => :highest_card,
      :top_pair => :highest_card,
      :bottom_pair => :highest_card
    }
  end

  def hand_rankings
    {
      :straight_flush => [:kickers],
      :four_of_a_kind => [:four_of_a_kind, :kickers],
      :full_house => [:three_of_a_kind, :pair],
      :flush => [:kickers],
      :straight => [:kickers],
      :three_of_a_kind => [:three_of_a_kind, :kickers],
      :two_pair => [:top_pair, :bottom_pair, :kickers],
      :pair => [:pair, :kickers],
      :high_card => [:kickers]
    }
  end

end
