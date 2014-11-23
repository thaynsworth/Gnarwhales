class Project < ActiveRecord::Base
  
  belongs_to :user
  has_many :comments
  has_many :collaborations
  has_many :skills, as: :skillable
  has_many :contributions
  has_many :notifications
  has_attached_file :image

  validates :title, :description, :start_date, :end_date, :location, presence: true
  validates_attachment_content_type :image, :content_type => ["image/jpg","image/jpeg","image/png"]

  def location_url
    self.location.gsub(' ', '+')
  end

  # def skill_list
  #   skills.join(", ")
  # end

  # def skill_list=(skills_string)
  #   skills_array = skills_string.split(",").collect{|s| s.strip.downcase}.uniq
  #   new_or_found_skills = skills_array.collect { |skill| Skill.find_or_create_by(skill: skill) }
  #   self.skill = new_or_found_skills
  # end

end
