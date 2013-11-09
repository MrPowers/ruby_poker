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

    it "returns a pair of Aces compared to a pair of eights" do
      cards = [
        Card.new(suit: "s", number: "3"),
        Card.new(suit: "d", number: "4"),
        Card.new(suit: "h", number: "5"),
        Card.new(suit: "c", number: "A"),
        Card.new(suit: "c", number: "A")
      ]
      pair_aces = FiveCardHand.new(cards)

      flush_cards = [
        Card.new(suit: "d", number: "3"),
        Card.new(suit: "s", number: "4"),
        Card.new(suit: "s", number: "5"),
        Card.new(suit: "s", number: "8"),
        Card.new(suit: "s", number: "8")
      ]
      pair_eights = FiveCardHand.new(flush_cards)
      compare = CompareFiveCardHands.new(pair_aces, pair_eights)
      expect(compare.best_hand).to eq pair_aces
    end
  end
end
