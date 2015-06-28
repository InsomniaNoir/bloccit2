class CommentPolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    if current_user
  end
