require "rails_helper"

RSpec.describe User::ArticlesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/user/articles").to route_to("user/articles#index")
    end

    it "routes to #show" do
      expect(:get => "/user/articles/1").to route_to("user/articles#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/user/articles").to route_to("user/articles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/user/articles/1").to route_to("user/articles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/user/articles/1").to route_to("user/articles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user/articles/1").to route_to("user/articles#destroy", :id => "1")
    end
  end
end
