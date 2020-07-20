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
       if   @spot.save
            redirect_to admins_spot_path(@spot)
       else
        @spots = Spot.all
        @tourists = Tourist.all
        render :index
        end
    end

    def edit
        @spot = Spot.find(params[:id])
        @tourists = Tourist.all
    end

    def update
        @spot = Spot.find(params[:id])
        if  @spot.update(spot_params)
            redirect_to admins_spots_path   
        else
            @tourists = Tourist.all
            render :edit            
        end
    end

    def destroy
        @spot = Spot.find(params[:id])
        @spot.destroy
        redirect_to admins_spots_path
    end

    private
    def spot_params
        params.require(:spot).permit(:address, :name, :overview, :addredd, :image, :tourist_id, :latitude, :longitude)
    end
end

