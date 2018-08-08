class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.references :request, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :status, default: 0, null: false
      t.integer :accepted_price, null: false
      t.string :file

      t.timestamps
    end
  end
end
