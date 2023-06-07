class BlackJack

  attr_accessor :current_deck, :player, :comp, :current_bank, :current_player

  def initialize(name)
    @current_deck = Deck.new
    @player = Gamer.new(name)
    @comp = Gamer.new('Diller')
    @current_bank = 0
  end

  def deal
    current_deck.shuffle
    player.take_card(current_deck)
    player.take_card(current_deck)
    player.bank -=10
    comp.take_card(current_deck)
    comp.take_card(current_deck)
    comp.bank -=10
    @current_bank +=20
    @current_player = player
  end

  def menu
    player.show_gamer
    puts 'Что выхотите сделать? Введите номер меню.'
    puts '1. Пропустить.'
    puts '2. Добавить карту.'
    puts '3. Открыть карты.'
    input = gets.to_i
    case input
    when 1
      skip
    when 2
      current_player.take_card(current_deck)
      if current_player.summ > 21 
        reveal
      else
        player.show_gamer
        skip
      end
    when 3
      reveal
    end
  end

  def skip
    if (player.deck_g.length == 3) && (comp.deck_g.length ==3)
      reveal
    else
      if current_player == player
        @current_player = comp
        diller_menu
      else
        @current_player = player
        menu
      end
    end
  end

  def reveal
    player.show_gamer
    if (player.summ > comp.summ) && (player.summ < 22)
      vinner(player)
    else
      vinner(comp)
    end
  end
  
  def vinner(name)
    name.bank += current_bank
  end

  def diller_menu
    

end

