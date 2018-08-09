class CreateDesigns < ActiveRecord::Migration[5.2]
  def change
    create_table :designs do |t|
      t.text :description
      t.string :name
      t.integer :likes
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
