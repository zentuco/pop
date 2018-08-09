class Contribution < ApplicationRecord
  belongs_to :user
  belongs_to :request
  validates :tokens, presence: true
end
