class Breach < ApplicationRecord
    has_many :emails_breaches
    has_many :emails, through: :emails_breaches
end
