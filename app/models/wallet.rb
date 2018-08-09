class Wallet < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :orders
end
