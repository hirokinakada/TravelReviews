class TouristsController < ApplicationController

    def index
        @tourists = Tourist.all
    end

    def show
        @tourist = Tourist.find(params[:id])
        @spots = @tourist.spots.where(tourist_id: @tourist.id)
    end

end
