class Deck
  attr_accessor :card, :deck, :suit

  SUIT = ["+", "<3", "^", "<>"]

  def initialize
    self.deck = []
    SUIT.each do |s|
      (2 .. 10).each do |i|
        self.deck << [s, i]
      end
      ["J", "D", "K", "A"].each do |i|
        self.deck <<[s, i]
      end
    end
  end

  def shuffle
    deck.sort_by!{rand}
  end
end
