class User < ApplicationRecord
    has_many :comments
    has_many :commented_recipes, through: :comments, source: :recipe
    has_many :recipes
    has_secure_password

    validates_presence_of :first_name, :last_name, :email, :user_name
    validates_uniqueness_of :email, :user_name

    def self.full_name
        byebug 
        "#{self.first_name} #{self.last_name}"
    end 

end
