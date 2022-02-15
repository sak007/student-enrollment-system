class Course < ApplicationRecord
    belongs_to :instructor
    has_many :enrollment, dependent: :delete_all
    validates :name, presence: true
    validates :description, presence: true
    validates :instructor_name, presence: true
    validates :weekday1, presence: true, inclusion: { in: ['MON', 'TUE', 'WED', 'THU', 'FRI'] }
    validates :weekday2,comparison: {other_than: :weekday1 }, allow_nil: true
    validates :starttime, presence: true
    validates :endtime, presence: true
    #validates :code, presence: true, uniqueness: true, format: { with: \[A-Z]{3}d{3} } message: "Please Enter a valid code" }
    validates :capacity, presence: true
    validates :wlcapacity, presence: true
    validates :room, presence: true
    validates :status, presence: true

end
