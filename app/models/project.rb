class Project < ActiveRecord::Base
  
  has_many :collaborations
  belongs_to :user

  validates :title, :description, :start_date, :end_date, presence: true

  # def skill_list
  #   skills.join(", ")
  # end

  # def skill_list=(skills_string)
  #   skills_array = skills_string.split(",").collect{|s| s.strip.downcase}.uniq
  #   new_or_found_skills = skills_array.collect { |skill| Skill.find_or_create_by(skill: skill) }
  #   self.skill = new_or_found_skills
  # end

end
