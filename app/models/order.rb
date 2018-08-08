class Order < ApplicationRecord
  belongs_to :wallet

  enum :status [:pending, :paid]
end
