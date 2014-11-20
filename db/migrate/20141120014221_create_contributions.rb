class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.references :skill, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
