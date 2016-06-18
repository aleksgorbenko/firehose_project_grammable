class Gram < ActiveRecord::Base
  validates :message, presence: true, length: { within: 3..1000 }
  mount_uploader :picture, PictureUploader
  belongs_to :user
end
