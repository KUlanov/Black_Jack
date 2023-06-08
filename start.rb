require_relative 'black_jack'
require_relative 'deck'
require_relative 'gamer'

game = BlackJack.new('Koty')
game.deal
loop do
  puts "Хотите сыграть еще?"
  puts "1. Начать заново."
  puts "Введите  любой другой символ чтобы выйти."
  if gets.to_i == 1
    game = BlackJack.new('Koty')
    game.deal
  else
    break
  end
end
