class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :status, default: 0, null: false
      t.integer :amount, null: false
      t.integer :tokens, null: false
      t.references :wallet, foreign_key: true

      t.timestamps
    end
  end
end