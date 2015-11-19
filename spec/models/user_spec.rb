require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new}

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:uuid) }
    it { should validate_uniqueness_of(:uuid) }
  end

  describe 'assotiations' do
    it { should have_many(:orders) }
  end

end
