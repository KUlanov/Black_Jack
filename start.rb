require_relative 'black_jack'
require_relative 'deck'
require_relative 'gamer'

puts " Мы начинаем игру Блек Джэк!"
puts "Как вас зовут?"
game = BlackJack.new(gets.chomp)
game.deal