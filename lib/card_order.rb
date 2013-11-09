module CardOrder
  def sort_best_to_worst(cards)
    cards.sort_by { |card| sort_order.index(card.number) }
  end

  def sort_order
    ["A", "K", "Q", "J", "10", "9", "8", "7", "6", "5", "4", "3", "2"]
  end

  def sort_index(number)
    sort_order.index(number)
  end
end
