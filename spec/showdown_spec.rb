require "spec_helper"

describe Showdown do
  context "#best_pair" do
    it "returns a hand with a pair of Aces over a hand with a pair of 2s" do
      pair_aces = FiveCardHand.new([
        Card.new(suit: "s", number: "3"),
        Card.new(suit: "d", number: "2"),
        Card.new(suit: "h", number: "4"),
        Card.new(suit: "c", number: "A"),
        Card.new(suit: "c", number: "A")
      ])
      pair_twos = FiveCardHand.new([
        Card.new(suit: "s", number: "3"),
        Card.new(suit: "d", number: "7"),
        Card.new(suit: "h", number: "4"),
        Card.new(suit: "c", number: "2"),
        Card.new(suit: "c", number: "2")
      ])
      showdown = Showdown.new(pair_aces, pair_twos)
      expect(showdown.best_pair).to eq pair_aces
    end

    it "returns a hand with a better kicker if two hands have the same pair" do
      eight_kicker = FiveCardHand.new([
        Card.new(suit: "s", number: "3"),
        Card.new(suit: "d", number: "2"),
        Card.new(suit: "h", number: "8"),
        Card.new(suit: "c", number: "A"),
        Card.new(suit: "c", number: "A")
      ])
      four_kicker = FiveCardHand.new([
        Card.new(suit: "s", number: "3"),
        Card.new(suit: "d", number: "2"),
        Card.new(suit: "h", number: "4"),
        Card.new(suit: "c", number: "A"),
        Card.new(suit: "c", number: "A")
      ])
      showdown = Showdown.new(eight_kicker, four_kicker)
      expect(showdown.best_pair).to eq eight_kicker
    end
  end
end
