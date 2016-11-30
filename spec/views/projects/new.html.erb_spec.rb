require 'rails_helper'

RSpec.describe "projects/new", type: :view do
  before(:each) do
    assign(:project, Project.new(
      :name => "MyString",
      :slogan => "MyString",
      :description => "MyText",
      :approved => false,
      :user => nil
    ))
  end

  it "renders new project form" do
    render

    assert_select "form[action=?][method=?]", projects_path, "post" do

      assert_select "input#project_name[name=?]", "project[name]"

      assert_select "input#project_slogan[name=?]", "project[slogan]"

      assert_select "textarea#project_description[name=?]", "project[description]"

      assert_select "input#project_approved[name=?]", "project[approved]"

      assert_select "input#project_user_id[name=?]", "project[user_id]"
    end
  end
end
