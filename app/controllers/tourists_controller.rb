class TouristsController < ApplicationController

    def index
        @tourists = Tourist.all
    end

    def show
        @tourist = Tourist.find(params[:id])
    end

 private
    def tourist_params
        params.require(:tourist).permit(:name, :image, :overview)
    end
end
