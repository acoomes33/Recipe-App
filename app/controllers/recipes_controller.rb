class RecipesController < ApplicationController
    # layout "custom"
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]

    def new
        @recipe = Recipe.new
        10.times { @recipe.ingredients.build }
    end 

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.valid?
            @recipe.save
            # redirect_to recipe_path
            redirect_to recipe_path(@recipe)
        else
            flash[:notice] = @recipe.errors.full_messages.join(" ")
            render :new
        end
    end 

    def show
    end 

    def index
        byebug
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
            render :edit
        end 
    end 

    def destroy
        @recipe.destroy
        redirect_to root_path
        # redirect_to recipes_path
    end 

    private

    def recipe_params
        params.require(:recipe).permit(
            :name,
            :description,
            :steps,
            :stars,
            :dietary_restrictions,
            ingredients_attributes:[:name, :count, :measurement] 
        )
    end

    def set_recipe
        @recipe = Recipe.find(params[:id])
      end

end
