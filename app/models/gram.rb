class Gram < ActiveRecord::Base
  validates :message, presence: true, length: { within: 3..1000 }
  validates :picture, presence: true
  mount_uploader :picture, PictureUploader

  belongs_to :user
  has_many :comments
end
