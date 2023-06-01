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
    deck_g.each do |i[1]|
      if i.to_int
        self.summ = summ +i
      elsif i == "A"
        if summ < 12
          summ += 10
        else
          summ += 1
        end
      else
        summ += 10
      end
    end
  end
end