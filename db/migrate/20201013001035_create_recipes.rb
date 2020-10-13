class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.text :steps
      t.float :stars
      t.string :dietary_restrictions
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
