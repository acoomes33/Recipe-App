class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates_presence_of :title, :body, :rating
   validate :rating_range

  private

  def rating_range
    if (0..5).none? { |num| num == rating }
      errors.add(:rating, "must be between 0-5")
    end
  end 

end
