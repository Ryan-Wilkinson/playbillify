class Ability
  include CanCan::Ability

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    def initialize(user)
        user ||= User.new # guest user (not logged in)
        if user.organization?
          can :manage, Organization, user_id: user.id
          can :manage, Event, :organization => { user_id: user.id }
          can :manage, Ad, :event => { :organization => { user_id: user.id }}
          can :manage, Ad, event_id: nil
        elsif user.advertiser?
          can :manage, Business, user_id: user.id
          can :read, Organization
          can :read, Event
          can :purchase, Ad, advertiser_id: nil
          can :update, Ad, advertiser_id: nil
          can :update, Ad, advertiser_id: user.id
          can :read, Ad, advertiser_id: nil
          can :purchased_ads, Ad

        end
    end
end







