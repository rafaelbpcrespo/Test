require 'rails_helper'

RSpec.describe Cep, type: :model do
  let(:cep) { Cep.new}

  describe 'validations' do
    it { should validate_presence_of(:code) }
    it { should validate_uniqueness_of(:code) }
  end
end
