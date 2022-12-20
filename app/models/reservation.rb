class Reservation < ApplicationRecord

    has_one_attached :picture
    belongs_to :room, optional: true
    belongs_to :user

    validates :start_date, presence: true
    validates :end_date, presence: true

end
