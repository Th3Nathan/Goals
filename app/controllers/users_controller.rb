class UsersController < ApplicationController
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
            redirect_to user_url
        else 
            render :new
        end 
    end 

    def show 
        if current_user.nil?
            #go to login if tries to show a user without user
            redirect_to new_session_url
            return 
        end 
        @user = current_user
        render :show
    end 

    private 
    def user_params
        params.require(:user).permit(:username, :password)
    end 
end
