class EventPolicy < ApplicationPolicy
  
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.has_role? :admin
        scope.all
      else
        scope.where(:user_id => user.id)
      end
    end
  end
  
  def index?
    true
  end
  
  def show?
    user.has_role?(:admin) or (user.has_role?(:organizer) and record.user_id = user.id)
  end
  
  def new?
    user.has_role?(:admin) or user.has_role?(:organizer)
  end
  
  def create?
    user.has_role?(:admin) or user.has_role?(:organizer)
  end
  
  def edit?
    user.has_role?(:admin) or (user.has_role?(:organizer) and record.user_id = user.id)
  end
  
  def update?
    user.has_role?(:admin) or (user.has_role?(:organizer) and record.user_id = user.id)
  end
  
  def destroy?
    user.has_role?(:admin) or (user.has_role?(:organizer) and record.user_id = user.id)
  end
  
end