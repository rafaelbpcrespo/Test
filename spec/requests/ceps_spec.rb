require 'rails_helper'

RSpec.describe "Ceps", type: :request do
  describe "GET /ceps" do
    it "works! (now write some real specs)" do
      get ceps_path
      expect(response).to have_http_status(200)
    end
  end
end
