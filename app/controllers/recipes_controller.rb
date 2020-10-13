class RecipesController < ApplicationController

    def new
    end 

    def create
    end 

    def show
    end 

    def index
    end 

    def edit
    end 

    def update
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

end
