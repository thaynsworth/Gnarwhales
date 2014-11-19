class Project < ActiveRecord::Base
  belongs_to :user

  validates :title, :description, :start_date, :end_date, :user_id, presence: true
end
