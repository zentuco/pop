class Order < ApplicationRecord
  belongs_to :wallet
  monetize :amount_cents

  enum state: [:pending, :paid]
end
