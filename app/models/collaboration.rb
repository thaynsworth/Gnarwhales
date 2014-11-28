class Collaboration < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_many :notifications, as: :notificationable

end
