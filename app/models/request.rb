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

  def total_tokens
    tokens_sum = 0
    self.contributions.each do |contribution|
      tokens_sum += contribution.tokens
    end
    tokens_sum
  end
end
