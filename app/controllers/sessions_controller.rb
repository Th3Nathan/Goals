class SessionsController < ApplicationController
    def create 
        #signs a user in
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user.nil?
            render :new 
        else 
            log_in!(@user)
            redirect_to user_url(@user)
        end 
    end 

    def destroy
        #signs out
        log_out!
        redirect_to new_session_url
    end 

    def new 
        #presents a login form 
        render :new
    end 
end
