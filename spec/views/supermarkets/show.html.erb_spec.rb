require 'rails_helper'

RSpec.describe "supermarkets/show", type: :view do
  before(:each) do
    @supermarket = assign(:supermarket, Supermarket.create!(
      :name => "Name",
      :cep => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
