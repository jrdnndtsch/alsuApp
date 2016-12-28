class AddPhotoToProjectStory < ActiveRecord::Migration
  def up
      add_attachment :project_stories, :img
    end

    def down
      remove_attachment :project_stories, :img
    end
end
