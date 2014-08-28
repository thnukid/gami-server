require "rails_helper"

RSpec.describe AliasesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/aliases").to route_to("aliases#index")
    end

    it "routes to #new" do
      expect(:get => "/aliases/new").to route_to("aliases#new")
    end

    it "routes to #show" do
      expect(:get => "/aliases/1").to route_to("aliases#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/aliases/1/edit").to route_to("aliases#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/aliases").to route_to("aliases#create")
    end

    it "routes to #update" do
      expect(:put => "/aliases/1").to route_to("aliases#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/aliases/1").to route_to("aliases#destroy", :id => "1")
    end

  end
end
