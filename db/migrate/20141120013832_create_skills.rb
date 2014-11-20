class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :skill
      t.references :user
      t.references :project

      t.timestamps
    end
  end
end
