require 'rails_helper'

RSpec.describe "ceps/new", type: :view do
  before(:each) do
    assign(:cep, Cep.new(
      :code => "MyString"
    ))
  end

  it "renders new cep form" do
    render

    assert_select "form[action=?][method=?]", ceps_path, "post" do

      assert_select "input#cep_code[name=?]", "cep[code]"
    end
  end
end
