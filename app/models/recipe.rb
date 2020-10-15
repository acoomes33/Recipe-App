class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredient_recipes
  has_many :comments
  has_many :ingredients, through: :ingredient_recipes
  has_many :users, through: :comments

  validates_presence_of :name, :steps, :description

  accepts_nested_attributes_for :ingredients, reject_if: proc {|ing| ing['name'].blank? || ing['count'].blank? || ing['measurement'].blank? }

end
