require "spec_helper"

describe FloorsController do
  describe "routing" do

    it "routes to #index" do
      get("/floors").should route_to("floors#index")
    end

    it "routes to #new" do
      get("/floors/new").should route_to("floors#new")
    end

    it "routes to #show" do
      get("/floors/1").should route_to("floors#show", :id => "1")
    end

    it "routes to #edit" do
      get("/floors/1/edit").should route_to("floors#edit", :id => "1")
    end

    it "routes to #create" do
      post("/floors").should route_to("floors#create")
    end

    it "routes to #update" do
      put("/floors/1").should route_to("floors#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/floors/1").should route_to("floors#destroy", :id => "1")
    end

  end
end
