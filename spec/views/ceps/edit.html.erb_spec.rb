require 'rails_helper'

RSpec.describe "ceps/edit", type: :view do
  before(:each) do
    @cep = assign(:cep, Cep.create!(
      :code => "MyString"
    ))
  end

  it "renders the edit cep form" do
    render

    assert_select "form[action=?][method=?]", cep_path(@cep), "post" do

      assert_select "input#cep_code[name=?]", "cep[code]"
    end
  end
end
