require "spec_helper"

describe FiveCardHand do
  let(:cards) do
    [
      Card.new(suit: "s", number: "3"),
      Card.new(suit: "d", number: "3"),
      Card.new(suit: "h", number: "5"),
      Card.new(suit: "c", number: "5"),
      Card.new(suit: "c", number: "A")
    ]
  end
  let(:hand) { FiveCardHand.new(cards) }

  context "#pair" do
    it "returns true if there is a pair" do
      expect(hand.pair?).to be_true
    end

    it "retuns false if there is no pair" do
      cards = [
        Card.new(suit: "s", number: "3"),
        Card.new(suit: "d", number: "4"),
        Card.new(suit: "h", number: "5"),
        Card.new(suit: "c", number: "6"),
        Card.new(suit: "c", number: "A")
      ]
      hand = FiveCardHand.new(cards)
      expect(hand.pair?).to be_false
    end
  end

  context "#two_pair?" do
    it "returns true if there are two pairs" do
      expect(hand.two_pair?).to be_true
    end

    it "returns false if there are not two pairs" do
      cards = [
        Card.new(suit: "s", number: "3"),
        Card.new(suit: "d", number: "3"),
        Card.new(suit: "h", number: "3"),
        Card.new(suit: "c", number: "6"),
        Card.new(suit: "c", number: "A")
      ]
      hand = FiveCardHand.new(cards)
      expect(hand.two_pair?).to be_false
    end
  end

  context "#three_of_a_kind" do
    it "returns false if there is not a three of a kind" do
      expect(hand.three_of_a_kind?).to be_false
    end

    it "retuns true if there is a three_of_a_kind" do
      cards = [
        Card.new(suit: "s", number: "3"),
        Card.new(suit: "d", number: "3"),
        Card.new(suit: "h", number: "3"),
        Card.new(suit: "c", number: "6"),
        Card.new(suit: "c", number: "A")
      ]
      hand = FiveCardHand.new(cards)
      expect(hand.three_of_a_kind?).to be_true
    end
  end

  context "#four_of_a_kind" do
    it "returns false if there is not a four of a kind" do
      expect(hand.four_of_a_kind?).to be_false
    end

    it "retuns true if there is a four_of_a_kind" do
      cards = [
        Card.new(suit: "s", number: "3"),
        Card.new(suit: "d", number: "3"),
        Card.new(suit: "h", number: "3"),
        Card.new(suit: "c", number: "3"),
        Card.new(suit: "c", number: "A")
      ]
      hand = FiveCardHand.new(cards)
      expect(hand.four_of_a_kind?).to be_true
    end
  end

  context "#full_house?" do
    it "returns false if there is no full house" do
      expect(hand.full_house?).to be_false
    end

    it "retuns true if there is a full_house" do
      cards = [
        Card.new(suit: "s", number: "3"),
        Card.new(suit: "d", number: "3"),
        Card.new(suit: "h", number: "3"),
        Card.new(suit: "c", number: "8"),
        Card.new(suit: "c", number: "8")
      ]
      hand = FiveCardHand.new(cards)
      expect(hand.full_house?).to be_true
    end
  end

  context "#flush" do
    it "returns false if the suit is not all the same" do
      expect(hand.flush?).to be_false
    end

    it "returns true if the suit of all the cards is the same" do
      cards = [
        Card.new(suit: "s", number: "3"),
        Card.new(suit: "s", number: "3"),
        Card.new(suit: "s", number: "3"),
        Card.new(suit: "s", number: "8"),
        Card.new(suit: "s", number: "8")
      ]
      hand = FiveCardHand.new(cards)
      expect(hand.flush?).to be_true
    end
  end

  context "straight?" do
    it "returns false if there is not a straight" do
      expect(hand.straight?).to be_false
    end

    it "returns true if there is a straight" do
      cards = [
        Card.new(suit: "s", number: "A"),
        Card.new(suit: "s", number: "2"),
        Card.new(suit: "s", number: "3"),
        Card.new(suit: "s", number: "4"),
        Card.new(suit: "s", number: "5")
      ]
      hand = FiveCardHand.new(cards)
      expect(hand.straight?).to be_true
    end
  end

  context "#straight_flush?" do
    it "returns false if there is not a straight flush" do
      expect(hand.straight_flush?).to be_false
    end

    it "returns true if there is a straight flush" do
      cards = [
        Card.new(suit: "s", number: "A"),
        Card.new(suit: "s", number: "2"),
        Card.new(suit: "s", number: "3"),
        Card.new(suit: "s", number: "4"),
        Card.new(suit: "s", number: "5")
      ]
      hand = FiveCardHand.new(cards)
      expect(hand.straight_flush?).to be_true
    end
  end

  context "#ranking" do
    it "returns 1 for a straight flush" do
      cards = [
        Card.new(suit: "s", number: "A"),
        Card.new(suit: "s", number: "2"),
        Card.new(suit: "s", number: "3"),
        Card.new(suit: "s", number: "4"),
        Card.new(suit: "s", number: "5")
      ]
      hand = FiveCardHand.new(cards)
      expect(hand.ranking).to eq 1
    end
  end

end
