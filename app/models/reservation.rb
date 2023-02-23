class Reservation < ApplicationRecord

    has_one_attached :picture
    belongs_to :room, optional: true
    belongs_to :user

    validates :start_date, presence: true
    validates :end_date, presence: true

    validate :start_end_check

    def start_end_check
        if start_date.present? && end_date.present? && start_date >= end_date
          errors.add(:end_date, "は開始日より前の日付は選択できません。") 
        end
    end


end
