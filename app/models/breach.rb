class Breach < ApplicationRecord
    has_many :emails_breaches
    has_many :emails, through: :emails_breaches

    def self.breach_name_to_obj(breaches)
        breaches.map do |breach|
            Breach.find_by(name: breach["Name"])
        end
    end
end
