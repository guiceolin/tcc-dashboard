class Ability
  include CanCan::Ability

  def initialize(user)
    cannot :manage, :all
    can :manage, :all if user.is_a? Admin

    if user.is_a? Manager
      can :create,       ::Project
      can(:manage,       ::Project) { |p| user.managed_projects.include? p }
      can :manage_users, ::Project

      can(:finish,       ::MasterProject) { |p| user.master_projects.include? p }

      can(:manage,       ::Membership) { |m| m.project.managers.include? user}
    end
    if user.is_a? Member
      can(:read, ::Project) { |p| p.members.include?(user) }
      can(:edit, ::Project) { |p| p.members.include?(user) }
      can(:set_active, ::Project)  { |p| p.members.include?(user) }
      can(:finish, ::Project)  { |p| p.members.include?(user) }
      can(:update, ::Project) { |p| p.members.include?(user) }

      can(:read, ::Membership) { |m| m.project.members.include?(user) }
      can(:manage, ::Task) { |t| t.project.members.include?(user) }
      can(:manage, ::Document) { |t| t.project.members.include?(user) }
    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
