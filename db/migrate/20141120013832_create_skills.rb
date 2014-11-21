class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.references :skillable, polymorphic: true
      t.string :skill

      t.timestamps
    end
  end
end
