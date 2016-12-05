require 'rails_helper'

RSpec.describe "project_stories/show", type: :view do
  before(:each) do
    @project_story = assign(:project_story, ProjectStory.create!(
      :media_type => "Media Type",
      :description => "MyText",
      :video_link => "Video Link",
      :project => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Media Type/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Video Link/)
    expect(rendered).to match(//)
  end
end
