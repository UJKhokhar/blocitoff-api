class ApplicationPolicy
  attr_reader :user, :record

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    record_exists?
  end

  def create?
    user_exists?
  end

  def new?
    create?
  end

  def update?
    record_owned_by_user?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  def scope
    record.class
  end

  # --------------------------- Utility methods --------------------------------

  def record_owned_by_user?
    return false if record_user.nil?
    return false unless user_exists?
    record.user == user
  end

  def user_exists?
    user.present?
  end

end

