require_relative 'deck'
require_relative 'hand'

class Card
  attr_reader :suit, :rank
  attr_accessor :points

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
    @points = card_value
  end

  def face_card?
    "JQK".include?(@rank)
  end

  def ace?
    @rank == "A"
  end

  def number_card?
    (2..10).include?(@rank.to_i)
  end

  def card_value
    if face_card?
      10
    elsif ace?
      11
    else
      @rank.to_i
    end
  end
end
