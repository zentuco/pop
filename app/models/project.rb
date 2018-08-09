class Project < ApplicationRecord
  belongs_to :request
  belongs_to :user

  validates :user, presence: true
  validates :request, presence: true
  validates :accepted_price, presence: true

  enum status: [:designing, :validating, :validated]

end
