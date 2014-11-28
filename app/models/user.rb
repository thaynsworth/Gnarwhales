class User < ActiveRecord::Base

  # this is an example of a scope.  the arrow thing indicates
  # that a proc is being defined.

  scope :alphabetized, -> { all.group_by{|u| u.name[0] }}

  has_many :contributions
  has_many :comments
  # sweet before save.
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: { maximum: 50 }

  # its sort of weird to defined a constant amidst this other macro declarations.
	validates :email, presence: true,  length: { maximum: 255 },
	                  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
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
    # assignment is not necessary
    self.collaborations.map do |collab|
      if collab.status != "pending"
        Project.find(collab.project_id)
      end
    end
  end
  def pending_collabs
    # assignment is not necessary
    self.collaborations.map do |collab|
      if collab.status == "pending"
        Project.find(collab.project_id)
      end
    end
  end
end
