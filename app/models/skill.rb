class Skill < ActiveRecord::Base
  has_many :contributions
  has_many :projects, through: :contributions

  # def to_s
  #   skill
  # end
end
