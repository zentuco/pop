class Project < ApplicationRecord
  belongs_to :request
  belongs_to :designer

  enum status: [:designing, :validating, :validated]

end
