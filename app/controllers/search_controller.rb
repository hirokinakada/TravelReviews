class SearchController < ApplicationController

    def search
        @spots = Spot.search(params[:search])
    end
end
