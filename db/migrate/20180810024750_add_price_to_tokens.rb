class AddPriceToTokens < ActiveRecord::Migration[5.2]
  def change
    add_monetize :tokens, :price, currency: { present: false }
  end
end
