class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :emails
end
