class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def show?
    true
  end

  def create?
    user == comment.author ||
      !comment.author.private? ||
      comment.author.followers.include?(user)
  end

  def update?
    user == comment.author
  end
end
