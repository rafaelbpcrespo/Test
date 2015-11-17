require 'rails_helper'

RSpec.describe "supermarkets/index", type: :view do
  before(:each) do
    assign(:supermarkets, [
      Supermarket.create!(
        :name => "Name",
        :cep => nil
      ),
      Supermarket.create!(
        :name => "Name",
        :cep => nil
      )
    ])
  end

  it "renders a list of supermarkets" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
