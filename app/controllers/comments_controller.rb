class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end 

    def create
        @comment = Comment.new(comment_params)
        if @comment.valid?
            @comment.save

            # redirect_to comment_path
            redirect_to comment_path(@comment)
        else
            render :new
        end
    end 

    private

    def comment_params
        params.require(:comment).permit(:title, :body, :user_id, :recipe_id)
    end 
end
