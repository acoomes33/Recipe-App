class RemoveDietaryRestrictionsFromRecipes < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :dietary_restrictions, :string
  end
end
