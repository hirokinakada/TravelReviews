class SearchController < ApplicationController

    def search
        @tourist_or_spot = params[:option]
    if @tourist_or_spot  == "1"
        @tourists = Tourist.search(params[:search], @tourist_or_spot)
    else
        @spots = Spot.search(params[:search], @tourist_or_spot)
    end
    end
end
