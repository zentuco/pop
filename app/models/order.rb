class Order < ApplicationRecord
  belongs_to :wallet
  monetize :amount_cents

  enum status: [:pending, :paid]
end
