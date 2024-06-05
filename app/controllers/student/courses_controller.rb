class Student::CoursesController < Student::BaseController
    def index
        render json: student_courses, status: :ok

    end


    private 

    def student_courses
        current_student.enrollments.map(&:course)
    end
end
