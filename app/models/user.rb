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
  has_many :skills, as: :skillable
  has_many :contributions
  has_many :notifications
  has_many :updates

  def collabs
    collabs_array = self.collaborations.map do |collab|
      if collab.status != "pending"
        Project.find(collab.project_id)
      end
    end
    collabs_array
  end
  def pending_collabs
    pending_collabs_array = self.collaborations.map do |collab|
      if collab.status == "pending"
        Project.find(collab.project_id)
      end
    end
    pending_collabs_array
  end
end
