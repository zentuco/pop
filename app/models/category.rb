class Category < ApplicationRecord
  has_many :designs
  validates :name, presence: true
end
