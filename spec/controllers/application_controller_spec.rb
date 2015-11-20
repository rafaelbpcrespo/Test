require 'rails_helper'

RSpec.describe ApplicationController do

  describe '#current_order' do

    let(:user) { FactoryGirl.create :user}

    context 'user has items on his shopping cart' do
      it 'show the order that is already in progress' do
        order = FactoryGirl.create :order, user: user, uuid: user.uuid
        item = FactoryGirl.create :item, order: order, unit_price: 2
        sign_in user
        expect(controller.send(:current_order)).to eq user.order_in_progress
        expect(controller.send(:current_order).items.size).to eq 1
      end
    end

    context 'user has no items on his shopping cart' do
      it 'start a new order and associate it to the user' do
        sign_in user
        expect(user.order_in_progress).to be_nil
        expect(controller.send(:current_order)).to be_a_new(Order)
      end
    end

  end
end