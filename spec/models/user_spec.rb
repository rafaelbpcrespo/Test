require 'rails_helper'

RSpec.describe User, type: :model do
  # let(:user) { User.new}

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:uuid) }
    it { should validate_uniqueness_of(:uuid) }
  end

  describe 'assotiations' do
    it { should have_many(:orders) }
  end

  describe '#order_in_progress' do
    let(:user) { FactoryGirl.create :user}

    it "return the order that has the User UUID associated" do
      order = FactoryGirl.create(:order, user: user, uuid: user.uuid)
      expect(user.order_in_progress).to eq order
    end

    it "return ONLY the order that was not checked out" do
      order = FactoryGirl.create(:order, user: user, uuid: user.uuid)
      order.checkout
      another_order = FactoryGirl.create(:order, user: user, uuid: user.uuid)
      expect(user.order_in_progress).to eq another_order
    end
  end

end
