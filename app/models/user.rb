class User < ApplicationRecord
    has_many :comments
    has_many :commented_recipes, through: :comments, source: :recipe
    has_many :recipes
    has_secure_password

    validates_presence_of :email, :first_name, :last_name
    validates_uniqueness_of :email 

    def full_name 
        "#{self.first_name} #{self.last_name}"
    end 

end
