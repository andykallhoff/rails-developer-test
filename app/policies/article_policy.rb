class ArticlePolicy < ApplicationPolicy
  def index?
    return true
  end

  def show?
    return true if user.present?
  end

  def new?
    return true if user.present? && user.admin?
    return true if user.present? && user.editor?
  end

  def create?
    return true if user.present? && user.admin?
    return true if user.present? && user.editor?
  end

  def edit?
    return true if user.present? && user.admin?
    return true if user.present? && user == record.user
  end

  def update?
    return true if user.present? && user.admin?
    return true if user.present? && user == record.user
  end

  def destroy?
    return true if user.present? && user.admin?
    return true if user.present? && user == record.user
  end
end
