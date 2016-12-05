class AddQuestionsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :objective, :text
    add_column :projects, :outcome, :text
    add_column :projects, :budget, :text
  end
end
