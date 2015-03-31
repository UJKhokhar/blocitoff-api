class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :permission
  has_one :user
  has_many :items
end
