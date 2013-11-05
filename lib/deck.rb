class Deck
  def suits
    ["h", "d", "s", "c"]
  end

  def numbers
    ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
  end

  def cards
    numbers.product(suits)
  end

  def shuffle
    cards.shuffle
  end
end
