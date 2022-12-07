class Reservation < ApplicationRecord

    has_one_attached :picture
    belongs_to :room
    belongs_to :user

end
