class ListPolicy < ApplicationPolicy
  def index
    user.exists?
  end  

  def show
    list_is?('open', 'viewable') || record_owned_by_user?
  end

  def update
    list_is?('open') || record_owned_by_user?
  end
  # --------------------------- Utility methods --------------------------------

  def list_is?(*permissions)
    user_exists? && permissions.any? { |permission| list.send(:"#{permission}?") }
  end
end