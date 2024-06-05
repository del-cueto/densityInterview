class Student < User
    #single table inheritance
    default_scope {where(role: 'student')}
    has_many :enrollments
    has_many :courses, through: :enrollments
    has_many :grades, through: :enrollments



end
