class CompareFiveCardHands
  attr_reader :first_hand, :second_hand
  def initialize(first_hand, second_hand)
    @first_hand = first_hand
    @second_hand = second_hand
  end

  def best_hand
    first_hand.ranking < second_hand.ranking ? first_hand : second_hand
  end

end
