class Design < ApplicationRecord
  belongs_to :category
  has_many :attachments
  accepts_nested_attributes_for :attachments
  has_many :requests
  validates :name, presence: true
  validates :description, presence: true
end
