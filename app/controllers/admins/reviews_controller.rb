class Admins::ReviewsController < ApplicationController

    before_action :authenticate_admin!, only: [:destroy]

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to admins_spot_path(@review.spot)
	end
end
