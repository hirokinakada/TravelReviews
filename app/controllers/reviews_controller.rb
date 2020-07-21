class ReviewsController < ApplicationController

    before_action :authenticate_customer!, only: [:create, :destroy]

    def create
        @review = Review.new(review_params)
        if  @review.save
            redirect_to spot_path(@review.spot)
        else
            @spot = @review.spot#????
            #@spot = Spot.find(params[:review][:spot_id])
            render 'spots/show'
        end
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