class Course < ApplicationRecord
    belongs_to :instructor
    has_many :enrollment, dependent: :delete_all
end
