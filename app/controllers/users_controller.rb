class UsersController < ApplicationController

    def show
        @user = User.find(params[:id]).inspect
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save 
          flash[:notice] = "user was created successfully!"
          redirect_to user_path(@user)
        else
          render :new
        end
    end

    def user_params
        params.require(:user).permit(:username, :email, :password, :birth, :phone)
    end
end