class Admins::ReviewsController < ApplicationController
    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to admins_spot_path(@review.spot)
	end
end
