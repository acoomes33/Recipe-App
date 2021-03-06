class CommentsController < ApplicationController
    load_and_authorize_resource


    def index
        if params[:recipe_id]
          @recipe = Recipe.find_by_id(params[:recipe_id])
          # also verify that recipe exists
          @comments = @recipe.comments
        else 
          @comments = Comment.all
        end
      end
    
    def show
        if params[:recipe_id]
          @recipe = Recipe.find_by_id(params[:recipe_id])
          
          set_comment
            if @recipe.comments.include?(@comment)
                render :show
            else
                flash.now[:notice] = "Comment doesn't belong to recipe."
                redirect_to recipes_path
            end
        else 
          set_comment
        end
    end
    
    def new
        if params[:recipe_id]
          @recipe = Recipe.find_by_id(params[:recipe_id])
          @comment = @recipe.comments.build
        else 
          @comment = Comment.new
        end
    end
    
    def create
        if params[:recipe_id]
          @recipe = Recipe.find_by_id(params[:recipe_id])
          @comment = @recipe.comments.build(comment_params)
          @comment.user_id = current_user.id
        else 
          @comment = Comment.new(comment_params)
        end
    
        if @comment.save
          redirect_to @recipe
        else
            flash.now[:notice] = @comment.errors.full_messages.to_sentence
            render :new
        end
    end

    def edit
        if params[:recipe_id]
            @recipe = Recipe.find_by_id(params[:recipe_id])
            @comment = @recipe.comments.find_by(id: params[:id])
        else 
            set_comment
        end
    end 
  
    def update
        if params[:recipe_id]
            @recipe = Recipe.find_by_id(params[:recipe_id])
            @comment = @recipe.comments.find_by(id: params[:id])
            @comment.update(comment_params)
        else 
            set_comment
            @comment.update(comment_params)
        end
      
        if @comment.valid?
            @comment.save
            if params[:recipe_id] 
             redirect_to recipe_comment_path(@recipe, @comment)
            else
            redirect_to comment_path( @comment)
            end
        else
            flash.now[:notice] = @comment.errors.full_messages.to_sentence
            render :edit
        end
    end 
    
    def destroy
        set_comment
        @comment.destroy
        # redirect_to root_path
        redirect_to recipes_path
    end 
    
    private
    
    def comment_params
        params.require(:comment).permit(:id, :title, :rating, :body)
    end
    
    def set_comment
        @comment = Comment.find_by_id(params[:id])
    end
end
