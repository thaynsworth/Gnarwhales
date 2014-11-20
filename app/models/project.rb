class Project < ActiveRecord::Base
  belongs_to :user
  has_many :collaborations

  validates :title, :description, :start_date, :end_date, presence: true
end
