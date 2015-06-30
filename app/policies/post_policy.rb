class PostPolicy < ApplicationPolicy
  class Scope < Scope

    def resolve
      if user.admin?
        scope.all
      else
        scope.where(:published => true)
      end
    end
  end

  def update?
    user.present? && (record.user == user || user.admin? || user.moderator?)
  end

  def index?
    true
  end
end
