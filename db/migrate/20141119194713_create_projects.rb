class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :collaborators
      t.references :user, index: true

      t.timestamps
    end
  end
end
