class Project < ActiveRecord::Base
  belongs_to :user
  acts_as_votable

  has_attached_file :featured_img,
    default_url: "featured_img.jpg"
    validates_attachment_content_type :featured_img, content_type: /\Aimage\/.*\Z/

 	scope :submitted_and_approved, -> {where(published: true, approved: true)}
 	scope :submitted_and_pending, -> {where(published: true, approved: false)}

  def is_approved?
  	self.approved == true
  end
end
