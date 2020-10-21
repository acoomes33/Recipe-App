module RecipesHelper

    def formatted_time(obj)
        obj.created_at.strftime("%d %b %Y")
    end 

end
