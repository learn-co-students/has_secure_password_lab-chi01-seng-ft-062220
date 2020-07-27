class UsersController < ApplicationController
    before_action :current_user, only: [:home]

    def new
    end

    def home
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
        else
            redirect_to '/users/new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
