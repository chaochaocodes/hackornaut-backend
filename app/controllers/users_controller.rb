class UsersController < ApplicationController
    def login
        user = User.find_or_create_by(name: params["name"])
        render json: user
    end

    def save_search
        email = Email.find_or_create_by(address: params["address"], user_id: params["id"])
        user = User.find(params["id"])
        user.emails << email
        params["breaches"].map do |breach|
            email.breaches << Breach.find(breach["id"])
        end
    end
end
