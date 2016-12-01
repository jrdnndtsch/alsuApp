class Project < ActiveRecord::Base
  belongs_to :user
  acts_as_votable

  def is_approved?
  	self.approved == true
  end
end
