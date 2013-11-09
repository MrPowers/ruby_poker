require "spec_helper"

describe Showdown do
  context "#tiebreaker" do
    it "returns a pair of Aces over a pair of 2s" do
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
      expect(showdown.tiebreaker).to eq pair_aces
    end
  end

  context "#winning_hand" do
    it "returns a pair of Aces with a better kicker" do
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
      expect(showdown.tiebreaker).to eq eight_kicker
    end

    it "returns AA553 over AA332" do
      aa553 = FiveCardHand.new([
        Card.new(suit: "s", number: "3"),
        Card.new(suit: "d", number: "5"),
        Card.new(suit: "h", number: "5"),
        Card.new(suit: "c", number: "A"),
        Card.new(suit: "c", number: "A")
      ])
      aa332 = FiveCardHand.new([
        Card.new(suit: "s", number: "2"),
        Card.new(suit: "d", number: "3"),
        Card.new(suit: "h", number: "3"),
        Card.new(suit: "c", number: "A"),
        Card.new(suit: "c", number: "A")
      ])
      showdown = Showdown.new(aa553, aa332)
      expect(showdown.tiebreaker).to eq aa553
    end

    it "returns AA555 over AA333" do
      aa555 = FiveCardHand.new([
        Card.new(suit: "s", number: "5"),
        Card.new(suit: "d", number: "5"),
        Card.new(suit: "h", number: "5"),
        Card.new(suit: "c", number: "A"),
        Card.new(suit: "c", number: "A")
      ])
      aa333 = FiveCardHand.new([
        Card.new(suit: "s", number: "3"),
        Card.new(suit: "d", number: "3"),
        Card.new(suit: "h", number: "3"),
        Card.new(suit: "c", number: "A"),
        Card.new(suit: "c", number: "A")
      ])
      showdown = Showdown.new(aa555, aa333)
      expect(showdown.tiebreaker).to eq aa555
    end

    it "returns :draw for identical hands" do
      aa555 = FiveCardHand.new([
        Card.new(suit: "s", number: "5"),
        Card.new(suit: "d", number: "5"),
        Card.new(suit: "h", number: "5"),
        Card.new(suit: "c", number: "A"),
        Card.new(suit: "c", number: "A")
      ])
      showdown = Showdown.new(aa555, aa555)
      expect(showdown.tiebreaker).to eq :draw
    end
  end
end
