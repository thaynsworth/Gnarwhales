class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.text :body
      t.references :user, index: true
      t.references :project, index: true

      t.timestamps
    end
  end
end
