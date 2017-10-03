require_relative "card"
require_relative "deck"
require_relative "hand"
require "pry"


deck = Deck.new
player = Hand.new("Player")
dealer = Hand.new("Dealer")

puts "Welcome to Blackjack! ♦ ♣ ♠ ♥"
puts

2.times do
  deck.deal(player)
end
puts "Player's score is #{player.calculate_hand}"
puts

while player.calculate_hand < 21
  puts "Hit or Stand (h/s): "
  input = gets.chomp
  puts
  if input.downcase == 'h'
    deck.deal(player)
    puts "Player's score is #{player.calculate_hand}"
  elsif input.downcase == 's'
    puts "Player score: #{player.calculate_hand}"
    break
  end
end

puts

if player.calculate_hand > 21
  puts "Bust! You lose..."
  abort
end

  2.times do
    deck.deal(dealer)
  end
  puts "Dealer's score is #{dealer.calculate_hand}"
  while dealer.calculate_hand < 17
    deck.deal(dealer)
    puts "Dealer's score is #{dealer.calculate_hand}"
  end

  puts "Dealer Stands" unless dealer.calculate_hand > 21
  puts
  if dealer.calculate_hand > 21
    puts "Dealer Busts! You WIN!!!"
  elsif player.calculate_hand > dealer.calculate_hand
    puts "You win!"
  elsif dealer.calculate_hand > player.calculate_hand
    puts "Dealer wins!"
  else
    "Tie game!"
  end
