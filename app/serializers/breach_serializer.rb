class BreachSerializer < ActiveModel::Serializer
  attributes :id, :name, :title, :domain, :breach_date, :pwn_count, :description, :data_classes, :is_verified, :is_fabricated, :is_retired, :is_spam_list, :logo_path
  has_many :emails_breaches
  has_many :emails, through: :emails_breaches
end
