class Admin::CoursesController < Admin::BaseController
 def index
    courses = Course.all
    render json: courses
 end

 def show 
    course = Course.find(params[:id])
    render json: course
 end
 
 def create
    course = Course.new(course_params)
    if course.save 
        render json: course, status: :created
    else 
        render json: course.errors, status: :unprocessable_entity
    end
 end

 def update 
    course = Course.find(params[:id])
    if course.update(course_params)
        render json: course, status: :ok
    else
        render json: course.errors, status: :unprocessable_entity
    end
 end

 def destroy 
    course = Course.find(params[:id])
    if course.destroy
        head :no_content
    else
        render json: course.errors, status: :unprocessable_entity
    end
 end

 private 
 def course_params
    params.require(:course).permit(:name, :start_date, :end_date)
 end

end
