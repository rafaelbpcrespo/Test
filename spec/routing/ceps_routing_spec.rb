require "rails_helper"

RSpec.describe CepsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/ceps").to route_to("ceps#index")
    end

    it "routes to #new" do
      expect(:get => "/ceps/new").to route_to("ceps#new")
    end

    it "routes to #show" do
      expect(:get => "/ceps/1").to route_to("ceps#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/ceps/1/edit").to route_to("ceps#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/ceps").to route_to("ceps#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/ceps/1").to route_to("ceps#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/ceps/1").to route_to("ceps#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ceps/1").to route_to("ceps#destroy", :id => "1")
    end

  end
end
