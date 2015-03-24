class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  def items
    object.items
  end
end
