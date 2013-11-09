class PairAnalyzer
  def self.summary(cards)
    return { :pair => cards } if cards.length == 2
    two_pair_grouping = cards.group_by { |c| c.number }
    bottom_pair, top_pair = two_pair_grouping.keys.sort_by { |k| CardOrder.sort_index(k) }
    { :top_pair => two_pair_grouping[top_pair], :bottom_pair => two_pair_grouping[bottom_pair] }
  end
end
