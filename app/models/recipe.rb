class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredient_recipes
  has_many :comments
  has_many :ingredients, through: :ingredient_recipes
  has_many :users, through: :comments
end
