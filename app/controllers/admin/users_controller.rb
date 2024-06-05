class Admin::UsersController < Admin::BaseController
    before_action :validate_role, only:[:create]

    def index 
        users = Users.all
        render json: users
    end

    def create 
        user = User.new(user_params)
        if user.save
            render json: user, status: :created
        else
            render json: user.errors, status: :unprocessable_entity
        end
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            render json: user, status: :ok
        else
            render json: user.errors, status: :unprocessable_entity
        end
    end

    def destroy 
        user = User.find(params[:id])
        if user.destroy
            head :no_content
        else
            render json: user.errors, status: :unprocessable_entity
        end
    end
    
    private 
    def user_params
        params.require(:user).permit(:email, :password, :role)
    end

    def validate_role
        allowed_roles = ["student", "admin", "teacher"]
        unless allowed_roles.include(params[:user][:role])
            render json: { error: "Ivalid role" }, status: :unprocessable_entity
        end
    end
end