class Room < ApplicationRecord

      has_one_attached :photo
      has_many :reservation
      belongs_to :user

end
