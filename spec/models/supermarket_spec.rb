require 'rails_helper'

RSpec.describe Supermarket, type: :model do
  let(:supermarket) { Supermarket.new}

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:cep_id) }
  end

  describe 'assotiations' do
    it { should belong_to(:cep) }
    it { should have_many(:orders) }
    it { should have_many(:products) }
  end

end
