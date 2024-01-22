# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  # BEGIN
  def new?
    user
  end

  def create?
    user
  end

  def edit
    record.user_id == user.id || user.admin?
  end

  def update?
    user && (record.author_id == user.id || user.admin?)
  end

  def destroy?
    user && user.admin?
  end
  # END
end
