class Attachment < ApplicationRecord
  belongs_to :design
  validates :file, presence: true
  mount_uploader :file, FileUploader
  accepts_nested_attributes_for :design
end
