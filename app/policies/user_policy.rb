class UserPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def index?
    return user.admin
  end

  def show?
    true
  end


  def create?
    true
  end

  def new?
    create?
  end

  def update?
    return user.admin? || user == current_user
  end

  def edit?
    update?
  end

  def destroy?
    return user.admin? || user == current_user
  end

  def scope
    Pundit.policy_scope!(user, user.class)
  end
end
