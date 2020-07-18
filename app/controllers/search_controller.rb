class SearchController < ApplicationController

    def search
        @tourist_or_spot = params[:option]
        @how_search = params[:choice]
    if @tourist_or_spot  == "1"
        @tourists = Tourist.search(params[:search], @tourist_or_spot,@how_search)
    else
        @spots = Spot.search(params[:search], @tourist_or_spot,@how_search)
    end
    end
end
