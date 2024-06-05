class Student::UsersController < Student::BaseController
    def index 
        user = user.find(params[:id])
        render json: user
    end
    
    private 
    def user_params
        params.require(:user).permit(:email, :password, :role)
    end
end
