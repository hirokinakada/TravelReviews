class TouristsController < ApplicationController

    def index
        @tourists = Tourist.all
    end

    def show
        @tourist = Tourist.find(params[:id])
    end


end
