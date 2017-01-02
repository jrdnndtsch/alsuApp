class AddRowOrderToProjectStories < ActiveRecord::Migration
  def change
  	add_column :project_stories, :row_order, :integer
  end
end
