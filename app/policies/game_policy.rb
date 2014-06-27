class GamePolicy
  attr_reader :user, :game

  def initialize(user, game)
    @user = user
    @game = game
  end

  def index?
    false
  end

  def show?
    true
  end

  def create?
    user.username != "Guest"
  end

  def new?
    create?
  end

  def update?
    user == game.gamemaster
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  def scope
    Pundit.policy_scope!(user, game.class)
  end
end
