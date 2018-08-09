class Request < ApplicationRecord
  belongs_to :user
  belongs_to :design

  has_many :contributions

  enum kind: [:original, :improve]
end
