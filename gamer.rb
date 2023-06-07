class Gamer
  attr_accessor :card, :deck_g, :bank, :summ, :name

  def initialize(name)
    @name = name
    @bank = 100
    @deck_g = []
    @summ = 0
  end

  def show_gamer
    puts "Ваши карты: #{@deck_g}"
    puts "Ваш банк: #{@bank}"
    puts "Сумма ваших карт :#{summ}"
  end

  def take_card(deck)
   deck_g << deck.deck.pop
   summ_card
  end

  def summ_card
    self.summ = 0
    deck_g.each do |i|
      if i[1].class == Integer
        self.summ = summ + i[1]
      elsif i[1] == "A"
        if summ < 12
          self.summ += 11
        else
          self.summ += 1
        end
      else
        self.summ += 10
      end
    end
  end
end