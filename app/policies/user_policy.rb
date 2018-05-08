class UserPolicy < ApplicationPolicy
  def index?
    @user.admin?
  end

  def new?
    index?
  end

  def create?
    index?
  end

  def edit?
    index?
  end

  def update?
    index?
  end

  #Unsure if we want this
  #def destroy?
  #  index?
  #end
end
