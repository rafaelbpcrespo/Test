require 'rails_helper'

RSpec.describe Cep, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:code) }
    it { should validate_uniqueness_of(:code) }
  end

  describe 'assotiations' do
    it { should have_many(:supermarkets) }
  end

end
