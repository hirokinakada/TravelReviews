class TouristsController < ApplicationController

    def index
        @tourists = Tourist.page(params[:page]).reverse_order.per(4)
    end

    def show
        @tourist = Tourist.find(params[:id])
        @spots = @tourist.spots.where(tourist_id: @tourist.id)
    end

end
