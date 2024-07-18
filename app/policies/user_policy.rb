class UserPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def show?
    true
  end

  def update?
    user == current_user
  end

  def destroy?
    user == current_user
  end

  def followers?
    true
  end

  def following?
    true
  end

  def liked?
    user == current_user ||
    !user.private? ||
    user.followers.include?(current_user)
  end

  def feed?
    user == current_user
  end

  def discover?
    user == current_user
  end

  def show_photos?
    user == current_user ||
    !user.private? ||
    user.followers.include?(current_user)
  end
end
