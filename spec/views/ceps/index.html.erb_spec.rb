require 'rails_helper'

RSpec.describe "ceps/index", type: :view do
  before(:each) do
    assign(:ceps, [
      Cep.create!(
        :code => "Code"
      ),
      Cep.create!(
        :code => "Code"
      )
    ])
  end

  it "renders a list of ceps" do
    render
    assert_select "tr>td", :text => "Code".to_s, :count => 2
  end
end
