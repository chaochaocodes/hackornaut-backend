class EmailSerializer < ActiveModel::Serializer
  attributes :id, :address
  has_many :emails_breaches
  has_many :breaches, through: :emails_breaches
end
