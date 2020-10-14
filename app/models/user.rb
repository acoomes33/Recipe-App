class User < ApplicationRecord
    has_many :comments
    has_many :commented_recipes, through: :comments, source: :recipe
    has_many :recipes
    has_secure_password

    validates_presence_of :first_name, :last_name
end
