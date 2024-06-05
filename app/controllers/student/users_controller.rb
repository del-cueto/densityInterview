class Student::UsersController < Student::BaseController
    def index 
        render json: current_user
    end
    
    private 
    def user_params
        params.require(:user).permit(:email, :password, :role)
    end
end
