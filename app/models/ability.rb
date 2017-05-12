class Ability
  include CanCan::Ability
    def initialize(user)
        user ||= User.new # guest user (not logged in)
        if user.organization?
          can :manage, Organization, user_id: user.id
          can :manage, Event, :organization => { user_id: user.id }
          can :manage, Ad, :event => { :organization => { user_id: user.id }}
          can :manage, Ad, event_id: nil
          cannot :manage, Business
        elsif user.advertiser?
          can :manage, Business, user_id: user.id
          can :read, Organization
          can :read, Event
          can :purchase, Ad, advertiser_id: nil
          can :update, Ad, advertiser_id: nil
          can :update, Ad, advertiser_id: user.id
          can :read, Ad, advertiser_id: nil
          can :purchased_ads, Ad, advertiser_id: user.id
          can :add_image, Ad, advertiser_id: user.id

        end
    end
end







