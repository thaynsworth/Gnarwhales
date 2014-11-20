class User < ActiveRecord::Base
  has_many :contributions
  has_many :comments
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  #regex for basic email -  should be a lot longer . . . a lot longer
	validates :email, presence: true,  length: { maximum: 255 },
	                  format: { with: VALID_EMAIL_REGEX },
	                  uniqueness: { case_sensitive: false }
	has_secure_password
  has_many :collaborations
  has_many :projects
	validates :password, length: { minimum: 6}, on: :create

  def collabs
    collabsArray = self.collaborations.map do |collab|
      if collab.status != "pending"
        Project.find(collab.project_id)
      end
    end
    collabsArray
  end
end
