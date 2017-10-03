require "spec_helper"

RSpec.describe Hand do

let(:deck) { Deck.new }
let(:hand) { Hand.new(deck) }

let(:hand1) { Hand.new("person") }
let(:hand2) { Hand.new("person") }
let(:hand3) { Hand.new("person") }
let(:hand4) { Hand.new("person") }
let(:hand5) { Hand.new("person") }
let(:hand6) { Hand.new("person") }

  describe "#calculate_hand" do
    it "calcuates the total value of the cards in the players hand" do
      hand1.cards = [Card.new("♦", "10"), Card.new("♥", "J")]
      hand4.cards = [Card.new("♦", "3"), Card.new("♥", "8")]
      hand6.cards = [Card.new("♦", "4"), Card.new("♥", "9"), Card.new("♥", "10")]
      expect(hand1.calculate_hand).to eq(20)
      expect(hand4.calculate_hand).to eq(11)
      expect(hand6.calculate_hand).to eq(23)
    end

    it "face cards are worth 10 points" do
      hand1.cards = [Card.new("♦", "10"), Card.new("♥", "J")]
      expect(hand1.cards.last.card_value).to eq(10)
    end

    it "aces are worth are either 1 point or 11 points (whichever value yields the best score, without going over 21 points)" do
      hand2.cards = [Card.new("♦", "A"), Card.new("♥", "A")]
      hand3.cards = [Card.new("♦", "A"), Card.new("♥", "8")]
      hand5.cards = [Card.new("♦", "4"), Card.new("♥", "9"), Card.new("♥", "A")]
      expect(hand2.calculate_hand).to eq(12)
      expect(hand3.calculate_hand).to eq(19)
      expect(hand5.calculate_hand).to eq(14)
    end

    describe "#players_hand" do
      it "the player should be dealt two cards" do
        hand1.cards = [Card.new("♦", "10"), Card.new("♥", "J")]
        expect(hand1.hand_count).to eq(2)
      end
    end
  end
end
