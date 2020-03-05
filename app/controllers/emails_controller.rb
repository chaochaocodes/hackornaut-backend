class EmailsController < ApplicationController
    def search 
        email = Email.new(address: params["search"])
        email.search
        render json: email
    end

    def show
        email = Email.find(params[:id])
        render json: email
    end
end
