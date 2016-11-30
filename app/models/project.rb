class Project < ActiveRecord::Base
  
  include Bootsy::Container
  
  belongs_to :user

  acts_as_votable

end
