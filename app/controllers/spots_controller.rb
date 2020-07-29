class SpotsController < ApplicationController
    def show
        @spot = Spot.find(params[:id])
        @review = Review.new
        #@reviews = @spot.reviews
    end

    def index
        @spots = Spot.page(params[:page]).reverse_order.per(6)
    end

end
