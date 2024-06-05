class Student::CoursesController < Student::BaseController
    def index
        student_courses
    end


    private 

    def student_courses
        current_user.enrollments.map(&:course)
    end
end
