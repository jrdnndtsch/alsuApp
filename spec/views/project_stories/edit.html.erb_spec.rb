require 'rails_helper'

RSpec.describe "project_stories/edit", type: :view do
  before(:each) do
    @project_story = assign(:project_story, ProjectStory.create!(
      :media_type => "MyString",
      :description => "MyText",
      :video_link => "MyString",
      :project => nil
    ))
  end

  it "renders the edit project_story form" do
    render

    assert_select "form[action=?][method=?]", project_story_path(@project_story), "post" do

      assert_select "input#project_story_media_type[name=?]", "project_story[media_type]"

      assert_select "textarea#project_story_description[name=?]", "project_story[description]"

      assert_select "input#project_story_video_link[name=?]", "project_story[video_link]"

      assert_select "input#project_story_project_id[name=?]", "project_story[project_id]"
    end
  end
end
