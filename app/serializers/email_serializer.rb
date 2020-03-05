class EmailSerializer < ActiveModel::Serializer
  attributes :id, :address
  has_many :breaches
end
