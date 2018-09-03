class CreateDesigners < ActiveRecord::Migration[5.2]
  def change
    create_table :designers do |t|
      t.text :description
      t.text :experience
      t.string :website
      t.string :thingiverse_username
      t.string :linkdin
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
