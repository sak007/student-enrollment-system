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
    validates :code, presence: true, uniqueness: true, format: { with: /(^[A-Z]{3}[0-9]{3}$)/, message: "Please Enter a valid code(3 chars in caps + 3 numbers eg. CSC101)" }
    validates :capacity, presence: true
    validates :wlcapacity, presence: true
    validates :room, presence: true
    validates :status, presence: true
    validate :validate_time

    def validate_time
        s = starttime.split(':')
        e = endtime.split(':')
        x1 = s[0].to_i
        x2 = s[1].to_i
        y1 = e[0].to_i
        y2 = e[1].to_i
        x = x1 * 60 + x2
        y = y1 * 60 + y2
        if y <= x
            errors.add(:endtime, "can't be less than or equal to start time")
        end
    end
end
