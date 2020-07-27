class ReviewsController < ApplicationController

    before_action :authenticate_customer!, only: [:create, :edit, :update]

    before_action :correct_customer, only: [:edit, :update]

    def create
        @review = Review.new(review_params)
        if  @review.save
            redirect_to spot_path(@review.spot)
        else
            @spot = @review.spot#
            #@spot = Spot.find(params[:review][:spot_id])
            render 'spots/show'
        end
    end

    def edit
        @review = Review.find(params[:id])
        @spot = @review.spot
    end

    def update
        @review = Review.find(params[:id])
        @spot = @review.spot
        if  @review.update(review_params)
            redirect_to spot_path(@review.spot)
        else
            render 'edit'
        end
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to spot_path(@review.spot)
    end




    private
    def review_params
        params.require(:review).permit(:title, :body, :rate, :customer_id, :spot_id, :image)
    end

    def correct_customer
        review = Review.find(params[:id])
        spot = review.spot
        customer = review.customer
        if current_customer != customer
        redirect_to root_path
        end
    end
end