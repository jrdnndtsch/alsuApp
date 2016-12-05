require "rails_helper"

RSpec.describe ProjectStoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/project_stories").to route_to("project_stories#index")
    end

    it "routes to #new" do
      expect(:get => "/project_stories/new").to route_to("project_stories#new")
    end

    it "routes to #show" do
      expect(:get => "/project_stories/1").to route_to("project_stories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/project_stories/1/edit").to route_to("project_stories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/project_stories").to route_to("project_stories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/project_stories/1").to route_to("project_stories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/project_stories/1").to route_to("project_stories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/project_stories/1").to route_to("project_stories#destroy", :id => "1")
    end

  end
end
