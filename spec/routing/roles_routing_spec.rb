require "spec_helper"

describe RolesController do
  describe "routing" do
    it "routes to #show" do
      get("/roles/1").should route_to("roles#edit", :id => "1")
    end
    it "routes to #update" do
      put("/roles/1").should route_to("roles#update", :id => "1")
    end
  end
end
