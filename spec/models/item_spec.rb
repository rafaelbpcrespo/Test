require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:quantity) }
    it { should validate_numericality_of(:quantity) }
  end

  describe 'assotiations' do
    it { should belong_to(:product) }
    it { should belong_to(:order) }
  end

  describe '#total_price' do
    let(:item) { FactoryGirl.create :item, unit_price: 3.50, quantity: 3 }

    it "set uuid nil to let the user session without cart association" do
      expect(item.total_price).to eq (item.unit_price * item.quantity)
    end
  end

end
