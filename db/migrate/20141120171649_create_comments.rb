class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true
      t.references :project, index: true
      t.string :body

      t.timestamps
    end
  end
end
