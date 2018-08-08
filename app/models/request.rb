class Request < ApplicationRecord
  belongs_to :user
  belongs_to :design

  enum type: [:new, :improve]
end
