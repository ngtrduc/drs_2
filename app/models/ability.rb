class Ability
  include CanCan::Ability

  def initialize user, namespace
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new
    if namespace == "admin"
      user.is_admin? ? can(:manage, :all) : cannot(:manage, :all)
    else
      if user.is_admin?
        cannot :manage, :all
      elsif user.manager?
        can :manage, Report
        can :manage, Division, id: user.profile.division_id
        can [:read, :update], Request
        cannot :destroy, Request
      else
        can :manage, Request, user_id: user.id
        can :manage, Report, user_id: user.id
        if user.profile.division_id.nil?
          cannot :manage, Request, user_id: user.id
          cannot :manage, Report
        end
        cannot [:edit, :update, :destroy], Request, Request do |request|
          request.approved? || request.not_approve?
        end
      end
      can :manage, Notification, user_id: user.id
    end

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
  end
end
