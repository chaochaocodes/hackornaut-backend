class UsersController < ApplicationController
    def login
        user = User.find_or_create_by(name: params["name"])
        render json: user
    end
end
