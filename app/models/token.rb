class Token < ApplicationRecord
  monetize :price_cents

  def calculate
    self.amount

  end
end
