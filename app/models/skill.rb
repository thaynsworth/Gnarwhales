=begin
  take care to remove commented code from your production source.
=end

class Skill < ActiveRecord::Base
  # holy polymorphisms, batman.
  belongs_to :skillable, polymorphic: true
  has_many :contributions
  has_many :projects, through: :contributions

  # def to_s
  #   skill
  # end
end
