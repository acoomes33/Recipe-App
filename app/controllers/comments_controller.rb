class CommentsController < ApplicationController

    def index
        if params[:recipe_id]
          @recipe = current_uer.recipes.find_by_id(params[:recipe_id])
          # also verify that recipe exists
          @comments = @recipe.comments
        else 
          @comments = Comment.all
        end
      end
    
      def show
        if params[:recipe_id]
          @recipe = current_user.recipes.find_by_id(params[:recipe_id])
          
          set_comment
          if @recipe.comments.include?(@comment)
             render :show
          else
            flash[:notice] = "comment doesn't belong to recipe."
            redirect_to recipes_path
          end
        else 
          set_comment
        end
      end
    
      def new
        if params[:recipe_id]
          @recipe = current_user.recipes.find_by_id(params[:recipe_id])
          @comment = @recipe.comments.build
        else 
          @comment = Comment.new
        end
      end
    
      def create
        if params[:recipe_id]
          @recipe = current_user.recipes.find_by_id(params[:recipe_id])
          @comment = @recipe.comments.build(comment_params)
        else 
          @comment = Comment.new(comment_params)
        end
    
        if @comment.save
          redirect_to @comment
        else
          render :new, alert: "Could not create that for you!"
        end
      end
    
    
      private
    
      def comment_params
        params.require(:comment).permit(:id, :title, :rating, :body)
      end
    
      def set_comment
        @comment = Comment.find_by_id(params[:id])
      end
end
