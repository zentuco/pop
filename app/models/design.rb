class Design < ApplicationRecord
  belongs_to :category
  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments
  has_many :requests, dependent: :destroy
  accepts_nested_attributes_for :requests
  has_many :contributions, through: :requests
  validates :name, presence: true
  validates :description, presence: true

  def self.trending
    #returns array of designs with highest number of tokens on a request
    Request.all.sort_by {|request| request.total_tokens}.reverse.map { |request| request.design }.uniq
  end
end
