require 'rails_helper'

RSpec.describe "supermarkets/new", type: :view do
  before(:each) do
    assign(:supermarket, Supermarket.new(
      :name => "MyString",
      :cep => nil
    ))
  end

  it "renders new supermarket form" do
    render

    assert_select "form[action=?][method=?]", supermarkets_path, "post" do

      assert_select "input#supermarket_name[name=?]", "supermarket[name]"

      assert_select "input#supermarket_cep_id[name=?]", "supermarket[cep_id]"
    end
  end
end
