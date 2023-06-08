class BlackJack

  attr_accessor :current_deck, :player, :comp, :current_bank, :current_player

  def initialize(name)
    @player = Gamer.new(name)
    @comp = Gamer.new('Diller')
  end

  def deal
    player.deck_g = []
    comp.deck_g = []
    @current_bank = 0
    @current_deck = Deck.new
    current_deck.shuffle
    player.take_card(current_deck)
    player.take_card(current_deck)
    player.bank -=10
    comp.take_card(current_deck)
    comp.take_card(current_deck)
    comp.bank -=10
    @current_bank +=20
    @current_player = player
    menu
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
      if player.deck_g.length == 3
        puts "У вас уже 3 карты!"
        skip
      else
        current_player.take_card(current_deck)
        if current_player.summ > 21
          vinner(comp)
        else
          player.show_gamer
          skip
        end
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
    if (player.summ > comp.summ) && (player.summ < 22)
      vinner(player)
    else
      vinner(comp)
    end
  end
  
  def vinner(name)
    name.bank += current_bank
    puts "Победитель #{name.name}"
    puts "Сумма карт игрока #{player.summ}"
    puts "Сумма карт диллера #{comp.summ}"
    if player.bank > 0 && comp.bank > 0
      deal
    else
      v_vin
    end
    puts
  end

  def v_vin
    puts "Игра закончена:"
    puts player.name
    puts player.bank
    puts
    puts "Диллер:"
    puts comp.bank
    puts
  end

  def diller_menu
    if comp.summ < 17
      comp.take_card(current_deck)
      if comp.summ > 21
        vinner(player)
      else
        skip
      end
    else
      skip
    end
  end    

end

