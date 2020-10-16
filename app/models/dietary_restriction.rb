class DietaryRestriction < ApplicationRecord
    has_many :dietary_restriction_recipes
    has_many :recipes, through: :dietary_restriction_recipes
end
