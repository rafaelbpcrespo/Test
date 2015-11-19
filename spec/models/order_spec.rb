require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:supermarket_id) }
  end

  describe 'assotiations' do
    it { should belong_to(:user) }
    it { should belong_to(:supermarket) }
    it { should have_many(:items) }
    it { should have_many(:products) }
  end

  describe '#subtotal' do
    let(:user) { FactoryGirl.create :user}
    let(:order) { FactoryGirl.create :order, user: user, uuid: user.uuid}
    let(:item) { FactoryGirl.create :item, order: order, unit_price: 2}
    let(:other_item) { FactoryGirl.create :item, order: order, unit_price: 1}
    let(:another_item) { FactoryGirl.create :item, order: order, unit_price: 4, quantity: 2}

    it "calculate the cart subtotal (quantity * unit_price of each item)" do
      order.items = [item, other_item, another_item]
      order.save
      expect(order.subtotal).to eq 11.to_d
    end
  end

  describe '#checkout' do
    let(:user) { FactoryGirl.create :user}
    let(:order) { FactoryGirl.create :order, user: user, uuid: user.uuid}

    it "set uuid nil to let the user session without cart association" do
      expect(order.uuid).to eq user.uuid
      order.checkout
      expect(order.uuid).to be_nil
    end
  end

end
