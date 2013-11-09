require "spec_helper"

describe FiveCardHandAnalyzer do
  context "#summary" do
    it "summarizes the duplicates and kickers for a hand with a pair" do
      three_spades = Card.new(suit: "s", number: "3")
      four_diamonds = Card.new(suit: "d", number: "4")
      five_hearts = Card.new(suit: "h", number: "5")
      ace_clubs = Card.new(suit: "c", number: "A")
      ace_diamonds = Card.new(suit: "d", number: "A")
      cards = [ three_spades, four_diamonds, five_hearts, ace_clubs, ace_diamonds ]
      analyzer = FiveCardHandAnalyzer.new(cards)
      expect(analyzer.summary).to eq ({ duplicates: [[ace_clubs, ace_diamonds]], kickers: [three_spades, four_diamonds, five_hearts] })
    end

    it "summarizes the duplicates and kickers for a hand with two pairs" do
      three_spades = Card.new(suit: "s", number: "3")
      four_diamonds = Card.new(suit: "d", number: "4")
      four_hearts = Card.new(suit: "h", number: "4")
      ace_clubs = Card.new(suit: "c", number: "A")
      ace_diamonds = Card.new(suit: "d", number: "A")
      cards = [ three_spades, four_diamonds, four_hearts, ace_clubs, ace_diamonds ]
      analyzer = FiveCardHandAnalyzer.new(cards)
      expect(analyzer.summary).to eq ({ duplicates: [[four_diamonds, four_hearts], [ace_clubs, ace_diamonds]], kickers: [three_spades] })
    end

    it "summarizes the duplicates for a three_of_a_kind and a pair" do
      four_spades = Card.new(suit: "s", number: "4")
      four_diamonds = Card.new(suit: "d", number: "4")
      four_hearts = Card.new(suit: "h", number: "4")
      ace_clubs = Card.new(suit: "c", number: "A")
      ace_diamonds = Card.new(suit: "d", number: "A")
      cards = [ four_spades, four_diamonds, four_hearts, ace_clubs, ace_diamonds ]
      analyzer = FiveCardHandAnalyzer.new(cards)
      expect(analyzer.summary).to eq ({ duplicates: [[four_spades, four_diamonds, four_hearts], [ace_clubs, ace_diamonds]], kickers: [] })
    end
  end

  context "#refined_summary" do
    it "summarizes the duplicates" do
      four_spades = Card.new(suit: "s", number: "4")
      four_diamonds = Card.new(suit: "d", number: "4")
      four_hearts = Card.new(suit: "h", number: "4")
      ace_clubs = Card.new(suit: "c", number: "A")
      ace_diamonds = Card.new(suit: "d", number: "A")
      cards = [ four_spades, four_diamonds, four_hearts, ace_clubs, ace_diamonds ]
      analyzer = FiveCardHandAnalyzer.new(cards)
      expect(analyzer.refined_summary).to eq "blah"
    end

    it "summarizes the duplicates and kickers for a hand with two pairs" do
      three_spades = Card.new(suit: "s", number: "3")
      four_diamonds = Card.new(suit: "d", number: "4")
      four_hearts = Card.new(suit: "h", number: "4")
      ace_clubs = Card.new(suit: "c", number: "A")
      ace_diamonds = Card.new(suit: "d", number: "A")
      cards = [ three_spades, four_diamonds, four_hearts, ace_clubs, ace_diamonds ]
      analyzer = FiveCardHandAnalyzer.new(cards)
      expect(analyzer.refined_summary).to eq "blah"
    end
  end
end
