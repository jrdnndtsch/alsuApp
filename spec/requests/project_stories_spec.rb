require 'rails_helper'

RSpec.describe "ProjectStories", type: :request do
  describe "GET /project_stories" do
    it "works! (now write some real specs)" do
      get project_stories_path
      expect(response).to have_http_status(200)
    end
  end
end
