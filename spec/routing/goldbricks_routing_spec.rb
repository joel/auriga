require "rails_helper"

RSpec.describe GoldbricksController, type: :routing, skip: true do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/goldbricks").to route_to("goldbricks#index")
    end

    it "routes to #new" do
      expect(:get => "/goldbricks/new").to route_to("goldbricks#new")
    end

    it "routes to #show" do
      expect(:get => "/goldbricks/1").to route_to("goldbricks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/goldbricks/1/edit").to route_to("goldbricks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/goldbricks").to route_to("goldbricks#create")
    end

    it "routes to #update" do
      expect(:put => "/goldbricks/1").to route_to("goldbricks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/goldbricks/1").to route_to("goldbricks#destroy", :id => "1")
    end

  end
end
