class Design < ApplicationRecord
  belongs_to :category
  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments
  has_many :requests, dependent: :destroy
  accepts_nested_attributes_for :requests
  has_many :contributions, through: :requests
  validates :name, presence: true
  validates :description, presence: true
end
