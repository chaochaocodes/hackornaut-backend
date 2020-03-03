class EmailsController < ApplicationController
    def search 
        email = Email.new(address: params["search"])
        email.search
        render json: email
    end
end
