class EmailsBreachSerializer < ActiveModel::Serializer
  attributes :id, :email_id, :breach_id
  belongs_to :email 
  belongs_to :breach
end
