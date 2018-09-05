class Project < ApplicationRecord
  belongs_to :request
  belongs_to :designer

  validates :designer, presence: true
  validates :request, presence: true
  validates :accepted_price, presence: true

  enum status: [:designing, :validating, :validated]

end
