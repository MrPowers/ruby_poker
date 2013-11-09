class FiveCardHandAnalyzer
  def initialize(cards)
    @cards = cards
  end

  def refined_summary
    result = {}
    summary[:duplicates].each do |duplicate|
      p duplicate
      result[:four_of_a_kind] = duplicate if duplicate.length == 4
      result[:three_of_a_kind] = duplicate if duplicate.length == 3
      if duplicate.length == 2
        result[:pair_one] ? result[:pair_two] = duplicate : result[:pair_one] = duplicate
      end
    end
    result[:kickers] = summary[:kickers]
    result
  end

  def summary
    cards = @cards
    result = {:duplicates => [], :kickers => []}
    while cards.length > 0
      card = cards.shift
      if duplicate?(card, cards)
        duplicate_cards = cards.select { |c| c.number == card.number }
        duplicates = [card]
        duplicate_cards.each { |c| duplicates.push cards.delete(c) }
        result[:duplicates].push duplicates
      else
        result[:kickers].push card
      end
    end
    result
  end

  private

  def duplicate?(card, cards)
    cards.map(&:number).include?(card.number)
  end

  def sort_cards(cards)
    cards.sort_by { |card| numbers.index(card.number) }
  end

  def numbers
    ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
  end

end
