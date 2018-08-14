class Contribution < ApplicationRecord
  belongs_to :user
  belongs_to :request
  validates :tokens, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :request, presence: true
end
