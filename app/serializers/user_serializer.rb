class UserSerializer < ActiveModel::Serializer
  attributes :id
  has_many :items
  has_many :lists
end
