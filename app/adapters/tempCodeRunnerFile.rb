    hibp_url = 'https://haveibeenpwned.com/api/v3/'
    breaches = 'breaches'

    def get_breaches
        request = Typhoeus.get(hibp_url + breaches)
        response = request.response
        puts response
    end

    get_breaches