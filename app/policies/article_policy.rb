class ArticlePolicy < ApplicationPolicy
  #Scope of roles
  #class Scope < Scope
  #  def resolve
  #    if user.admin?
  #      @list = scope.all
  #    end
  #  end
  #end

  def index?
    return true
  end

  def show?
    return true if user.admin?
    return true if user.present?
  end

  def new?
    return true if user.present? && user.editor?
  end

  def create?
    return true if user.present? && user.editor?
  end

  def edit?
    return true if user.admin?
    return true if user.present? && user == article.user
  end

  def update?
    return true if user.admin?
    return true if user.present? && user == article.user
  end

  def destroy?
    return true if user.admin?
    return true if user.present? && user == article.user
  end
end
