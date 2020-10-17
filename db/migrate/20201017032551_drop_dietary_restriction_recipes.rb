class DropDietaryRestrictionRecipes < ActiveRecord::Migration[6.0]
  def up
    drop_table :dietary_restriction_recipes
  end

  def down
    create_table :dietary_restriction_recipes do |t|
      t.belongs_to :dietary_restriction, null: false, foreign_key: true
      t.belongs_to :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
