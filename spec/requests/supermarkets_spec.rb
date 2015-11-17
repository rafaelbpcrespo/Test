require 'rails_helper'

RSpec.describe "Supermarkets", type: :request do
  describe "GET /supermarkets" do
    it "works! (now write some real specs)" do
      get supermarkets_path
      expect(response).to have_http_status(200)
    end
  end
end
