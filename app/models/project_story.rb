class ProjectStory < ActiveRecord::Base
  belongs_to :project

  include RankedModel
    ranks :row_order,
    :with_same => :project_id

  MEDIA_TYPES = ['video', 'text', 'image']

  has_attached_file :img,
    default_url: "featured_img.jpg"
    validates_attachment_content_type :img, content_type: /\Aimage\/.*\Z/
end
