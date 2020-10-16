class CommentsController < ApplicationController
    before_action :set_recipe, only: [:edit, :update, :destroy]

    def index
        @recipe = Recipe.find_by[id: params[:recipe_id]]
        @comments = @recipe.comments
    end 

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
            flash[:notice] = @comment.errors.full_messages.join(" ")
            render :new
        end
    end 

    def edit
    end 

    def update
        @comment.update(comment_params)
        if @comment.valid?
            @comment.save
            redirect_to comment_path(@comment)
        else 
            render :edit
        end 
    end 

    def destroy
        @comment.destroy
        redirect_to recipes_path
        # redirect_to comments_path
    end 

    private

    def comment_params
        params.require(:comment).permit(:title, :body)
    end 

    def set_comment
        Comment.find_by(id: params[:id])
    end
end
