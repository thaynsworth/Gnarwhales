class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :user, index: true
      t.references :project, index: true
      t.references :notificationable, polymorphic: true
      t.string :relation
      t.string :not_type
      t.string :description

      t.timestamps
    end
  end
end
