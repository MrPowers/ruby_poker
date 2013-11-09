require "spec_helper"

describe PairAnalyzer do
  context "#summary" do
    it "organizes a single pair" do
      three_spades = Card.new(suit: "s", number: "3")
      three_diamonds = Card.new(suit: "d", number: "3")
      cards = [
        three_spades,
        three_diamonds
      ]
      analyzer = PairAnalyzer.summary(cards)
      expected = { :pair => [three_spades, three_diamonds] }
      expect(analyzer.summary).to eq (expected)
    end

    it "organizes two pairs into a hash with top_pair and bottom_pair" do
      three_spades = Card.new(suit: "s", number: "3")
      three_diamonds = Card.new(suit: "d", number: "3")
      five_hearts = Card.new(suit: "h", number: "5")
      five_clubs = Card.new(suit: "c", number: "5")
      cards = [
        three_spades,
        three_diamonds,
        five_hearts,
        five_clubs,
      ]
      analyzer = PairAnalyzer.new(cards)
      expected = { :top_pair => [five_hearts, five_clubs], :bottom_pair => [three_spades, three_diamonds] }
      expect(analyzer.summary).to eq (expected)
    end
  end
end
