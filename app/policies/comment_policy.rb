class CommentPolicy < ApplicationPolicy
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
    user.present? && (user.admin? || !post.published?)
  end

  def index?
    true
  end
end
