require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { Product.new}

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:supermarket_id) }
  end

  describe 'assotiations' do
    it { should belong_to(:supermarket) }
  end

end
