class Attachment < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :design
  validates :file, presence: true
end
