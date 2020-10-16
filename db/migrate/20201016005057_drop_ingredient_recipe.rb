class DropIngredientRecipe < ActiveRecord::Migration[6.0]
  def change
    drop_table :ingredient_recipes
  end
end
