class ReviewsController < ApplicationController

    def create
        @review = Review.new(review_params)
        if  @review.save
            redirect_to spot_path(@review.spot)
        #ここにelse後から
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to spot_path(@review.spot)
	end




    private
    def review_params
        params.require(:review).permit(:title, :body, :rate, :customer_id, :spot_id, :image_id)
    end
end