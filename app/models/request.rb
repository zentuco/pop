class Request < ApplicationRecord
  belongs_to :user
  belongs_to :design
  has_one :project

  enum kind: [:original, :improve]
end
