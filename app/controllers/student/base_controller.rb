class Student::BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :verify_role
    
    def verify_role
        redirect_to '/' if current_user.role != 'student'
    end

    private 

    def current_student
        @current_student ||= Student.find(current_user.id)
    end
end
