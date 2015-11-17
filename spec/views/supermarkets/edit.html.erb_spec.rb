require 'rails_helper'

RSpec.describe "supermarkets/edit", type: :view do
  before(:each) do
    @supermarket = assign(:supermarket, Supermarket.create!(
      :name => "MyString",
      :cep => nil
    ))
  end

  it "renders the edit supermarket form" do
    render

    assert_select "form[action=?][method=?]", supermarket_path(@supermarket), "post" do

      assert_select "input#supermarket_name[name=?]", "supermarket[name]"

      assert_select "input#supermarket_cep_id[name=?]", "supermarket[cep_id]"
    end
  end
end
