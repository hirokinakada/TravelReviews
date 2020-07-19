class SpotsController < ApplicationController
    def show
        @spot = Spot.find(params[:id])
        @review = Review.new
        @reviews = @spot.reviews
    end

    def index
        @spots = Spot.all
    end

end
