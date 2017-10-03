require_relative 'deck'

class Hand
  attr_reader :role
  attr_accessor :cards

  def initialize(person)
    @cards = []
    @role = person
  end

  def points
    calculate_hand
  end

  def aces_present?
    @cards.any? { |card| card.ace? }
  end

  def calculate_hand
    ace_count = 0
    @cards.each do |card|
      if card.ace?
        ace_count += 1
      end
    end
    total = 0
    @cards.each do |card|
      total += card.points
    end
    while total > 21 && ace_count > 0
      total -= 10
      ace_count -= 1
    end
    return total
  end

  def hand_count
    cards.count
  end
end
