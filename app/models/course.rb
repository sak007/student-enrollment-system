class Course < ApplicationRecord
    belongs_to :instructor
    has_many :enrollment, dependent: :delete_all
    validates :name, presence: true
    validates :description, presence: true
    validates :instructor_id, presence: true
    validates :weekday1, presence: true, inclusion: { in: ['MON', 'TUE', 'WED', 'THU', 'FRI'] }
    validates :weekday2,comparison: {other_than: :weekday1 }, inclusion: { in: ['', 'MON', 'TUE', 'WED', 'THU', 'FRI'] }, allow_blank: true
    validates :starttime, presence: true, format: { with: /(^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$)/, message: "Please Enter a valid time in HH:SS format"}
    validates :endtime, presence: true, format: { with: /(^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$)/, message: "Please Enter a valid time in HH:SS format"}
    validates :code, presence: true, uniqueness: true, format: { with: /(^[A-Z]{3}[0-9]{3}$)/, message: "Please Enter a valid code" }
    validates :capacity, presence: true
    validates :wlcapacity, presence: true
    validates :room, presence: true
    validates :status, presence: true
    validate :validate_time

    def validate_time
        res = true
        if (starttime[0] + starttime[1]) > (endtime[0] + endtime[1])
            res = false
        elsif (starttime[0] + starttime[1]) == (endtime[0] + endtime[1])
            if (starttime[3] + starttime[4]) > (endtime[3] + endtime[4])
                res = false
            end
        end
        if !res
            errors.add(:endtime, "can't be greater than start time")
        end
    end
end
