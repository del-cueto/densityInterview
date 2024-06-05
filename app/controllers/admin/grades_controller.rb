class Admin::GradesController < Admin::BaseController
    before_action :set_enrollment

    def index 
        grades = @enrollment.grade
        render json: grades, status: :ok
    end
    
    def update 
        grade = Grade.find(params[:id])
        if grade.update(grades_params)
            render json: grade, status: :ok
        else
            render json: grade.errors, status: :unprocessable_entity
        end
    end

    private 

    def grades_params
        params.require(:grade).permit(:first_quarter, :second_quarter, :third_quarter, :fourth_quarter)
    end

    def set_enrollment
        @enrollment = Enrollment.find(params[:enrollment_id])
    end
end


