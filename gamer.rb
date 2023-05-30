class Gamer
  attr_accessor :card, :deck_g, :bank, :summ, :name

  def initialize(name)
    @name = name
    @bank = 100
    @deck_g = []
    @summ = 0
  end

  def take_card(deck)
   deck_g << deck.pop
  end

  def summ_card
    deck_g.each do |s, i|
      if i.to_int == 
      self.summ =
  end