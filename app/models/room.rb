class Room < ApplicationRecord

      has_one_attached :picture
      has_many :reservations
      belongs_to :user

end
