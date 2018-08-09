class Order < ApplicationRecord
  belongs_to :wallet
  validates :tokens, presence: true
  validates :amount, presence: true

  enum :status [:pending, :paid]
end
