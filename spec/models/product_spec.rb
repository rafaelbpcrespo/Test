require 'rails_helper'

RSpec.describe Product, :type => :aruba do

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:supermarket_id) }
    it { should validate_presence_of :image }
  end

  describe 'assotiations' do
    it { should belong_to(:supermarket) }
    it { should have_many(:orders) }
    it { should have_many(:items) }
  end


  describe '#image' do
    let(:product) { FactoryGirl.create :product, name: "sabonete" }
    it 'will create an image file on the configured path' do
      expect(product.image).to exist
    end
  end

  describe '#titleize_name' do
    let(:product) { FactoryGirl.build :product, name: "product"}

    it "apply titleize on Product's name before create" do

      expect(product.name).to eq "product"
      product.save
      expect(product.name).to eq "product".titleize
    end
  end

  describe '#search' do
    let(:product) { FactoryGirl.create :product, name: "arroz" }
    let(:product1) { FactoryGirl.create :product, name: "azeite" }
    let(:product2) { FactoryGirl.create :product, name: "feijão" }
    let(:product3) { FactoryGirl.create :product, name: "macarrão" }

    it "return products that match the search" do
      expect(Product.search("A")).to eq [product, product1]
    end

    let(:product) { FactoryGirl.create :product, name: "arroz" }
    let(:product1) { FactoryGirl.create :product, name: "azeite" }
    let(:product2) { FactoryGirl.create :product, name: "feijão" }
    let(:product3) { FactoryGirl.create :product, name: "macarrão" }

    it "return empty list when search does not match with any product" do
      expect(Product.search("teste")).to eq []
    end
  end

end
