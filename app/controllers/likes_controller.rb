class LikesController < ApplicationController
    before_action :authenticate_customer!, only: [:create, :destroy]

    def create
        @spot = Spot.find(params[:spot_id])
        @like = current_customer.likes.new(spot_id: @spot.id)
        @like.save
    end

    def destroy
        @spot = Spot.find(params[:spot_id])
        @like = current_customer.likes.find_by(spot_id: @spot.id)
        @like.destroy
    end

    private
    def spot_params
        @spot = Spot.find(params[:id])
    end
end
