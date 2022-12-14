class Reservation < ApplicationRecord

    has_one_attached :photo
    belongs_to :room
    belongs_to :user


end
