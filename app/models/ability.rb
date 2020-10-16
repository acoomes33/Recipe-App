class Ability
    include CanCan::Ability 

    def initialize(user)
        user ||= User.new #guest user

        if user.role? :admin
            can :manage, :all
        else 
            can :read, :all
            can :create, Comment
            can :update, Comment do |comment|
                comment.try(:user) == user || user.role?(:moderator)
           end 
            if us
        can :edit, Recipe, id: user.id
    end 