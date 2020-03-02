module HibpAdapter
    HIBP_URL = 'https://haveibeenpwned.com/api/v3/'
    HIBP_KEY = ENV["HIBP_API_KEY"]

    Typhoeus::Config.user_agent = "hackornaut"

    API_SERVICES = {
        breaches: 'breachedaccount',
        pastes: 'pasteaccount',
        all_breaches: 'breaches'
    }.freeze

    class Client
        attr_reader :email 

        def initialize(email)
            @email = email 
        end

        def get(service)
            req = Typhoeus.get(service_url(service), headers: {"hibp-api-key": HIBP_KEY})
            res = JSON.parse(req.body)
        end

        private 

        def service_url(service)
            HIBP_URL + API_SERVICES[service] + '/' + email
        end
    end

    class Breaches
        def self.get_all_breaches
            req = Typhoeus.get(HIBP_URL + API_SERVICES[:all_breaches])
            res = JSON.parse(req.body)
            res.each do |breach|
                new_breach = Breach.new(name: breach["Name"], title: breach["Title"], domain: breach["Domain"], breach_date: breach["BreachDate"], pwn_count: breach["PwnCount"], description: breach["Description"], data_classes: breach["DataClasses"], is_verified:breach["IsVerified"], is_fabricated: breach["IsFabricated"], is_retired: breach["IsRetired"], is_spam_list: breach["IsSpamList"], logo_path: breach["LogoPath"])
                if !Breach.find_by(name: new_breach.name) 
                    new_breach.save
                end
            end
        end
    end
end

