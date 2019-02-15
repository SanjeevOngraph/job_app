class Ability
  include CanCan::Ability

  def initialize(user)

    if user.nil?
      user = User.new
    end
    if user.has_role? :employer
      can :manage, post, user_id: user.id
    else user.has_role? :jobseeker
      can :read, post
    end

    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #

  end
end
