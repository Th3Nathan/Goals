class CommentsController < ApplicationController
    def create 
        #signup user
        @comment = Comment.new(comment_params)
        @comment.save
        if comment_params[:commentable_type] == "User"
          redirect_to user_url(comment_params[:commentable_id]) 
          return
        end 
        redirect_to goal_url(comment_params[:commentable_id])
        return
    end 

    private
    def comment_params
        params.require(:comment).permit(:body, :user_id, :commentable_id, :commentable_type)
    end 
end
