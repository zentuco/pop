class CreateWallets < ActiveRecord::Migration[5.2]
  def change
    create_table :wallets do |t|
      t.integer :tokens
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
