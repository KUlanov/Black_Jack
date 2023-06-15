class Gamer
  attr_accessor :card, :deck_g, :bank, :summ, :name

  def initialize(name)
    @name = name
    @bank = 100
    @deck_g = []
    @summ = 0
  end
  
  def take_card(deck)
   deck_g << deck.deck.pop
  end
  
end