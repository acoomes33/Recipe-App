class RecipesController < ApplicationController
    load_and_authorize_resource
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]

    def new
        @recipe = Recipe.new
        10.times { @recipe.ingredients.build }
        5.times { @recipe.dietary_restrictions.build }
    end 

    def create
        @recipe = current_user.recipes.new(recipe_params)
        if @recipe.valid?
            @recipe.save
            # redirect_to recipe_path
            redirect_to recipe_path(@recipe)
        else
            flash.now[:notice] = @recipe.errors.full_messages.to_sentence
            render :new
        end
    end 

    def show
        if @recipe
            render :show
        else
            flash.now[:notice] = "Recipe not Found!"
            redirect_to recipes_path
        end
    end 

    def index
        @recipes = Recipe.all
    end 

    def edit
    end 

    def update
        @recipe.update(recipe_params)
        if @recipe.valid?
            @recipe.save
            redirect_to recipe_path(@recipe)
        else 
            flash.now[:notice] = @recipe.errors.full_messages.to_sentence
            redirect_to edit_recipe_path(@recipe)
        end 
    end 

    def destroy
        @recipe.destroy
        # redirect_to root_path
        redirect_to recipes_path
    end 

    def order
        @recipes = Recipe.order(name: :asc)
    end 

    def search
    end
  
    def results
      @recipes = Recipe.search(params[:q])
      render :index
    end

    private

    def recipe_params
        params.require(:recipe).permit(
            :id,
            :name,
            :description,
            :steps,
            :stars,
            :dietary_restrictions,
            ingredients_attributes:[:id, :name, :count, :measurement] ,
            dietary_restrictions_attributes:[:id, :name]
        )
    end

    def set_recipe
        @recipe = Recipe.find_by(id: params[:id])
    end

end
