class Attachment < ApplicationRecord
  mount_uploader :file, FileUploader
  belongs_to :design
  validates :file, presence: true
end
