class Email < ApplicationRecord
    belongs_to :user
    has_many :emails_breaches
    has_many :breaches, through: :emails_breaches

    def search
        search_email = HibpAdapter::Client.new(self.address)
        email_breaches = search_email.get(:breaches)
        Breach.breach_name_to_obj(email_breaches).each do |breach|
            self.breaches << breach
        end
        puts Breach.breach_name_to_obj(email_breaches)
    end
end
