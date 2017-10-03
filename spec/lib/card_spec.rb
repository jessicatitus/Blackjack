require "spec_helper"


RSpec.describe Card do
  let(:card) {Card.new("♠", "8")}
  let(:king) {Card.new("♥", "K")}
  let(:ace_card) {Card.new("♠", "A")}

  describe "#initialize" do
    it "is a card object" do
      expect(card).to be_a(Card)
    end
    it "has a rank" do
      expect(card.rank).to eq("8")
    end
    it "has a suit" do
      expect(card.suit).to eq("♠")
    end
  end

  describe "#ace?" do
    it "returns false if the card is not an ace" do
      expect(king.ace?).to eq(false)
    end
    it "returns true if the card is an ace" do
      expect(ace_card.ace?).to eq(true)
     end


  describe ".new" do
    it "should have a rank and a suit as arguments" do
      expect(card).to be_a(Card)
    end
  end

  describe "#rank" do
    it "has a reader for rank" do
      expect(card.rank).to eq("8")
    end
  end

  describe "#suit" do
    it "has a reader for suit" do
      expect(card.suit).to eq("♠")
    end
  end

  describe "#face_card?" do
    it "returns true if the card is a face card" do
      expect(king.face_card?).to eq(true)
  end
  it "returns false if card is not a face_card" do
    expect(card.face_card?).to eq(false)
    expect(ace_card.face_card?).to eq(false)
  end
end


 describe "#card_value" do
   it "should have the value of ten for face cards" do
     expect(king.card_value).to eq(10)
   end
   it "should have the value of 11 for Aces" do
     expect(ace_card.card_value).to eq(11)
   end
   it "should have the value of the number card" do
     expect(card.card_value).to eq(8)
 end
end

  describe "#number_card?" do
    it "returns true if the card is a number card" do
      expect(card.number_card?).to eq (true)
    end
  it "returns false if the card is not a number card" do
    expect(king.number_card?).to eq(false)
    expect(ace_card.number_card?).to eq(false)
  end
end
end
end
