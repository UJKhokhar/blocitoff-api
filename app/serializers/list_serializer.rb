class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :permission
end
