class AddRecipeIdToDietaryRestrictions < ActiveRecord::Migration[6.0]
  def change
    add_reference :dietary_restrictions, :recipe, null: false, foreign_key: true
  end
end
