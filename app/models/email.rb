class Email < ApplicationRecord
    belongs_to :user 
    has_many :emails_breaches
    has_many :breaches, through: :emails_breaches
end
