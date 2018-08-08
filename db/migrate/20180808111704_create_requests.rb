class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true
      t.references :design, foreign_key: true
      t.integer :type
      t.text :description

      t.timestamps
    end
  end
end
