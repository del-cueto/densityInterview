class Course < ApplicationRecord
has_many :enrollments
has_many :students, through: :enrollments

before_create :define_end_date

private

    def define_end_date
        self.end_date = Date.parse(self.start_date) + 1.year
    end
end
    