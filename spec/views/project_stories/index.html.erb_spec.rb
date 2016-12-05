require 'rails_helper'

RSpec.describe "project_stories/index", type: :view do
  before(:each) do
    assign(:project_stories, [
      ProjectStory.create!(
        :media_type => "Media Type",
        :description => "MyText",
        :video_link => "Video Link",
        :project => nil
      ),
      ProjectStory.create!(
        :media_type => "Media Type",
        :description => "MyText",
        :video_link => "Video Link",
        :project => nil
      )
    ])
  end

  it "renders a list of project_stories" do
    render
    assert_select "tr>td", :text => "Media Type".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Video Link".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
