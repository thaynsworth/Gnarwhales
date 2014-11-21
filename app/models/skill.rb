class Skill < ActiveRecord::Base
  belongs_to :skillable, polymorphic: true
  has_many :contributions
  has_many :projects, through: :contributions

  # def to_s
  #   skill
  # end
end
