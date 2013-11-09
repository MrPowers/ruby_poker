class CardOrder
  def self.sort_best_to_worst(cards)
    cards.sort_by { |card| sort_order.reverse.index(card.number) }
  end

  def self.sort_order
    ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
  end

  def self.sort_index(number)
    sort_order.index(number)
  end
end
