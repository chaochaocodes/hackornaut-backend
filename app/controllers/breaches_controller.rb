class BreachesController < ApplicationController
    def index 
        @breaches = Breach.all
        render json: @breaches
    end
end
