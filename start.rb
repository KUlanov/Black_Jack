require_relative 'black_jack'
require_relative 'deck'
require_relative 'gamer'

game = BlackJack.new('Koty')
game.deal

puts "Хотите сыграть еще?"
puts "1. Начать заново."
puts "Нажмите любую кнопку чтобы выйти."
if gets.to_i == 1
  @game = BlackJack.new(game.player.name)
  game.deal
end
