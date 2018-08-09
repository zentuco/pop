class Request < ApplicationRecord
  belongs_to :user
  belongs_to :design
  has_one :project
  has_many :contributions
  validates :kind, presence: true
  validates :description, presence: true
  validates :user, presence: true
  validates :design, presence: true

  enum kind: [:original, :improve]
end
