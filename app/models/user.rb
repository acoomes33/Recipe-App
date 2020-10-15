class User < ApplicationRecord
    has_many :comments
    has_many :commented_recipes, through: :comments, source: :recipe
    has_many :recipes
    has_secure_password

    validates_presence_of :first_name, :last_name

    def self.full_name 
        "#{self.first_name} #{self.last_name}"
    end 

end
