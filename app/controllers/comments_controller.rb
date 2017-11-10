class UsersController < ApplicationController
    def create 
        #signup user
        @comment = Comment.new(comment_params)
        @comment.save
        redirect_to :back 
    end 

    private
    def comment_params
        params.require(:comment).permit(:body, :user_id, :commentable_id, :commentable_type)
    end 
end
