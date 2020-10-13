class CommentsController < ApplicationController
    def new
    end 

    def create
    end 

    private

    def comment_params
        params.require(:comment).permit(:title, :body, :user_id, :recipe_id)
    end 
end
