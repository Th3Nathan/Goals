class UsersController < ApplicationController

    def index 
        @users = User.all 
        render :index
    end 

    def new
        #present form for signup 
        @user = User.new 
        render :new 
    end 

    def create 
        #signup user
        @user = User.new(user_params)
        if @user.save 
            log_in!(@user)
            redirect_to user_url(@user)
        else 
            render :new
        end 
    end 

    def show 
        @user = User.find(params[:id])
        
        #current_user.includes(:goals, :comments)
        render :show
    end 

    private 
    def user_params
        params.require(:user).permit(:username, :password)
    end 
end
