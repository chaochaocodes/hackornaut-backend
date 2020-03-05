class BreachesController < ApplicationController
    def index 
        @breaches = Breach.all
        render json: @breaches
    end

    def thirty
        @thirtyBreaches = Breach.first(30)
        render json: @thirtyBreaches
    end
end
