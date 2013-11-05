require "spec_helper"

describe CompareFiveCardHands do
  context "#best_hand" do
    it "returns a flush compared to a three of a kind" do
      cards = [
        Card.new(suit: "s", number: "3"),
        Card.new(suit: "d", number: "3"),
        Card.new(suit: "h", number: "3"),
        Card.new(suit: "c", number: "6"),
        Card.new(suit: "c", number: "A")
      ]
      three_of_a_kind = FiveCardHand.new(cards)

      flush_cards = [
        Card.new(suit: "s", number: "3"),
        Card.new(suit: "s", number: "3"),
        Card.new(suit: "s", number: "3"),
        Card.new(suit: "s", number: "8"),
        Card.new(suit: "s", number: "8")
      ]
      flush = FiveCardHand.new(flush_cards)
      compare = CompareFiveCardHands.new(three_of_a_kind, flush)
      expect(compare.best_hand).to eq flush
    end
  end
end
