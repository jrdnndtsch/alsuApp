class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects
  acts_as_voter
  acts_as_token_authenticatable

  has_attached_file :avatar,
    styles: {
          thumbnail: '100x100^',
          header: '500x500^'
        },
        convert_options: {
          thumbnail: " -gravity center -crop '100x100+0+0'",
          header: " -gravity center -crop '500x500+0+0'"
        },
    default_url: "avatar.jpg"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def is_admin?
  	self.role == 'admin'
  end

  def full_name
    return "#{self.first_name} #{self.last_name}"
  end
end
