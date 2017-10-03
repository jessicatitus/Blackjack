require_relative 'card'
require 'pry'

class Deck
   RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  SUITS = ['♦', '♣', '♠', '♥']

  attr_accessor :cards

  def initialize
    @cards = build_deck
  end

  def build_deck
    cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        cards << Card.new(suit, rank)
      end
    end
    cards.shuffle!
  end

  def deal(person)
    card = @cards.pop
    person.cards << card
    puts "#{person.role} was dealt #{card.rank} #{card.suit}"
  end
end
