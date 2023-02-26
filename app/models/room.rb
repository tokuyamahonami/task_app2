class Room < ApplicationRecord

      mount_uploader :picture, PictureUploader
      has_one_attached :picture
      has_many :reservations
      belongs_to :user

end
