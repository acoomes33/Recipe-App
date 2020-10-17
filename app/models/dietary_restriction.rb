class DietaryRestriction < ApplicationRecord
    belongs_to :recipe, optional: true
    validates_presence_of :name
end
