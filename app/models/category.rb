class Category < ApplicationRecord
  has_many :designs
  validates :name, presence: true

  def self.category_name
    Category.all.map do |category|
      category.name
    end
  end
end
