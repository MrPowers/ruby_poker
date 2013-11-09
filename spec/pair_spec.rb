require "spec_helper"

describe Pair do
  context "#pair_number" do
    it "returns the number of the pair" do
      pair_aces = FiveCardHand.new([
        Card.new(suit: "s", number: "3"),
        Card.new(suit: "d", number: "2"),
        Card.new(suit: "h", number: "4"),
        Card.new(suit: "c", number: "A"),
        Card.new(suit: "c", number: "A")
      ])
      pair = Pair.new(pair_aces)
      expect(pair.pair_number).to eq "A"
    end
  end

  context "#kickers" do
    it "returns the kickers" do
      three_spades = Card.new(suit: "s", number: "3")
      two_diamonds = Card.new(suit: "d", number: "2")
      four_hearts = Card.new(suit: "h", number: "4")
      pair_aces = FiveCardHand.new([
        three_spades,
        two_diamonds,
        four_hearts,
        Card.new(suit: "c", number: "A"),
        Card.new(suit: "c", number: "A")
      ])
      pair = Pair.new(pair_aces)
      expect(pair.kickers).to eq [four_hearts, three_spades, two_diamonds]
    end
  end
end
