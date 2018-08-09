class Project < ApplicationRecord
  belongs_to :request
  belongs_to :user

  enum status: [:designing, :validating, :validated]

end
