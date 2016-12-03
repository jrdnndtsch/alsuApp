class Project < ActiveRecord::Base
  belongs_to :user
  acts_as_votable

  has_attached_file :featured_img,
    default_url: "featured_img.jpg"
    validates_attachment_content_type :featured_img, content_type: /\Aimage\/.*\Z/

  def is_approved?
  	self.approved == true
  end
end
