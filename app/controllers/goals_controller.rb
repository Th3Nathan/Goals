class UsersController < ApplicationController
    def new
        #present form for signup 
        @goal = Goal.new 
        render :new 
    end 

    def create 
        #signup user
        @goal = Goal.new(goal_params)
        if @goal.save 
            redirect_to goal_url(@goal)
        else 
            render :new
        end 
    end  

    def show 
        @goal = Goal.find(params[:id]).include(:comments)
        render :show
    end 

    private 
    def goal_params
        params.require(:goal).permit(:title, :details)
    end 
end
