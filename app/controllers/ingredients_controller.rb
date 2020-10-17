class IngredientsController < ApplicationController

    def new
        if params[:recipe_id]
            @recipe = Recipe.find_by_id(params[:sushi_id])
            @ingredient = @recipe.ingredients.build
        else
            @ingredient = Ingredient.new
        end
    end 

    def create
    end 

end
