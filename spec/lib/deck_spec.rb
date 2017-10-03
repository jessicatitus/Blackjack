require "spec_helper"

RSpec.describe Deck do
  let(:deck) {Deck.new}

  describe ".new" do
    it "should build an array of 52 cards" do
      expect(deck.cards.count).to eq(52)
      expect(deck.cards[0]).to be_a(Card)
    end
  end

  describe "#build_deck" do
    # Remember that the '#' in '#build_deck' means it's a method.
    it "builds a deck of 52 cards" do
      expect(deck.cards.size).to eq 52
    end

    it "creates unique cards" do
      expect(deck.cards.uniq.size).to eq 52
    end
  end

  describe "#deal" do
    it "removes correct number of cards" do
      start_size = deck.cards.size
      finish_size = start_size - 1
      hand = Hand.new("person")
      deck.deal(hand)
      expect(deck.cards.size).to eq finish_size
    end

    it "deals the top card in the deck" do
      correct_card = deck.cards[-1]
      hand1 = Hand.new("person")
      deck.deal(hand1)
      expect(hand1.cards[0]).to eq correct_card
    end
  end
end
