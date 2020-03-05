class BreachSerializer < ActiveModel::Serializer
  attributes :id, :name, :title, :domain, :breach_date, :pwn_count, :description, :data_classes, :is_spam_list, :logo_path
  has_many :emails
end
