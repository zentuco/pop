class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :state, default: 0
      t.string :token_sku, null: false
      t.monetize :amount, currency: { present: false }
      t.jsonb :payment
      t.references :wallet, foreign_key: true

      t.timestamps
    end
  end
end
