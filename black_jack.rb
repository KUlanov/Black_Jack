class BlackJack

  attr_accessor :current_deck, :player, :comp, :current_bank, :current_player

  def initialize(name)
    @player = Gamer.new(name)
    @comp = Gamer.new('Diller')
    deal
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
    show_gamer(current_player)
    show_diller
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
        if summ_card(current_player) > 21
          vinner(comp)
        else
          show_gamer(current_player)
          skip
        end
      end
    when 3
      reveal
    end
  end

  def show_gamer(name)
    puts "Карты: #{name.deck_g}"
    puts "Банк: #{name.bank}"
    puts "Сумма карт :#{summ_card(name)}"
  end

  def summ_card(name)
    summ = 0
    name.deck_g.each do |i|
      if i[1].to_i != 0
        summ += i[1].to_i
      elsif %w(J Q K).include?(i[1])
        summ += 10
      end
    end
    name.deck_g.each do |i|
      if i[1] == "A"
        if summ < 11
          summ += 11
        else
          summ += 1
        end
      end
    end
    summ
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
    if summ_card(player) > summ_card(comp)
      vinner(player)
    elsif summ_card(player) == summ_card(comp)
      puts "Ничья"
      puts
      player.bank +=10
      comp.bank +=10
      deal
    else
      vinner(comp)
    end
  end
  
  def vinner(name)
    name.bank += current_bank
    puts "Победитель #{name.name}"
    puts "Карты игрока: #{player.deck_g}"
    puts "Сумма карт игрока #{summ_card(player)}"
    puts "Карты диллера: #{comp.deck_g}"
    puts "Сумма карт диллера #{summ_card(comp)}"
    puts
    if player.bank > 0 && comp.bank > 0
      contine
    else
      v_vin
    end
  end

  def v_vin
    puts "Игра закончена:"
    puts player.name
    puts player.bank
    puts
    puts "Диллер:"
    puts comp.bank
    puts
    exit
  end

  def diller_menu
    if summ_card(comp) < 17
      comp.take_card(current_deck)
      if summ_card(comp) > 21
        vinner(player)
      else
        skip
      end
    else
      skip
    end
  end

  def contine  
    puts "Хотите сыграть еще?"
    puts "1. Начать заново."
    puts "Введите  любой другой символ чтобы выйти."
    if gets.to_i == 1
      deal
    else
      v_vin
    end
  end

  def show_diller
    print "Карты диллера: "
    (1 .. comp.deck_g.length).each do 
      print "*" 
    end
    puts
  end
end

