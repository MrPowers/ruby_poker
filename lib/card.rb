class Card
  attr_reader :suit, :number
  def initialize(input)
    @suit = input.fetch(:suit) # hearts (h), diamonds (d), spades (s), clubs (c)
    @number = input.fetch(:number)
  end
end
