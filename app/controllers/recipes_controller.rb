class RecipesController < ApplicationController
    before_action :set_recipe!, only: [:show, :edit, :update]

    def new
        @recipe = Recipe.new
    end 

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.valid?
            @recipe.save
            session[:recipe_id] = @recipe.id
            # redirect_to recipe_path
            redirect_to recipe_path(@recipe)
        else
            render :new
        end
    end 

    def show
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
            render :edit
        end 
    end 

    private

    def recipe_params
        params.require(:recipe).permit(
            :name,
            :description,
            :steps,
            :stars,
            :dietary_restrictions,
            :created_at,
            :updated_at,
            :user_id
        )
    end

    def set_recipe!
        @recipe = Recipe.find(params[:id])
      end

end
