require 'rails_helper'

RSpec.describe Food, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:food)).to be_valid
  end

  it 'is valid with a name and a description' do
    expect(FactoryBot.build(:food)).to be_valid
  end

  it 'is invalid without a name' do
    food = FactoryBot.build(:food, name: nil)
    food.valid?
    expect(food.errors[:name]).to include("can't be blank")
  end

  it "is invalid with a duplicate name" do
    food1 = FactoryBot.create(:food, name: 'Nasi Uduk')
    food2 = FactoryBot.build(:food, name: 'Nasi Uduk')

    food2.valid?

    expect(food2.errors[:name]).to include("has already been taken")
  end

  describe 'self#by_letter' do
    context 'with matching letter' do
      it "should return a sorted array of results that match" do
        food1 = FactoryBot.create(:food, name: 'Nasi Uduk')
        food2 = FactoryBot.create(:food, name: 'Kerak Telor')
        food3 = FactoryBot.create(:food, name: 'Nasi Semur Jengkol')

        expect(Food.by_letter("N")).to eq([food3, food1])
      end
    end
  end
end
