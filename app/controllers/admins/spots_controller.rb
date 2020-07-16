class Admins::SpotsController < ApplicationController

    def show
        @spot = Spot.find(params[:id])
    end

    def index
        @spots = Spot.all
        @spot = Spot.new
        @tourists = Tourist.all
    end

    def create
        @spot = Spot.new(spot_params)
        @spot.save
        redirect_to admins_spot_path(@spot)
    end

    def edit
        @spot = Spot.find(params[:id])
        @tourists = Tourist.all
    end

    def update
        @spot = Spot.find(params[:id])
        @spot.update(spot_params)
        redirect_to admins_spots_path
    end

    def destroy
        @spot = Spot.find(params[:id])
        @spot.destroy
        redirect_to new_admins_spot_path
    end

    private
    def spot_params
        params.require(:spot).permit(:address, :name, :overview, :addredd, :image, :tourist_id, :latitude, :longitude)
    end
end

