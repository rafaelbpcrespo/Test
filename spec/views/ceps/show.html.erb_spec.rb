require 'rails_helper'

RSpec.describe "ceps/show", type: :view do
  before(:each) do
    @cep = assign(:cep, Cep.create!(
      :code => "Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Code/)
  end
end
