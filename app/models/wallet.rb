class Wallet < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :orders

  validates :tokens, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
