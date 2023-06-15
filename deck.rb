class Deck
  attr_accessor :card, :deck, :suit

  SUIT = ["+", "<3", "^", "<>"]
  VALUE = %w(A 2 3 4 5 6 7 8 9 10 J Q K)

  def initialize
    self.deck = []
    SUIT.each do |s|
      VALUE.each do |i|
        self.deck << [s, i]
      end
    end
  end

  def shuffle
    deck.sort_by!{rand}
  end
end
