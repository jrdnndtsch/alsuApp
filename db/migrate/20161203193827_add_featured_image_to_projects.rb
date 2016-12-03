class AddFeaturedImageToProjects < ActiveRecord::Migration
 def up
     add_attachment :projects, :featured_img
   end

   def down
     remove_attachment :projects, :featured_img
   end
end
