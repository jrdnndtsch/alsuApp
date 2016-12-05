class CreateProjectStories < ActiveRecord::Migration
  def change
    create_table :project_stories do |t|
      t.string :media_type
      t.text :description
      t.string :video_link
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
