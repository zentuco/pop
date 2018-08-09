class Attachment < ApplicationRecord
  belongs_to :design
  validates :file, presence: true
end
