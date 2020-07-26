class FavoritesController < ApplicationController

    before_action :authenticate_customer!, only: [:create, :destroy]

    def create
        @review = Review.find(params[:review_id])
        @favorite = current_customer.favorites.new(review_id: @review.id)
        @favorite.save
    end

    def destroy
        @review = Review.find(params[:review_id])
        @favorite = current_customer.favorites.find_by(review_id: @review.id)
        @favorite.destroy
    end

    private
    def review_params
        @review = Review.find(params[:id])
    end
end
