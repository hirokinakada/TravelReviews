class Admins::TouristsController < ApplicationController

    def index
        @tourists = Tourist.all
        @tourist = Tourist.new
    end

    def show
        @tourist = Tourist.find(params[:id])
        @spots = @tourist.spots.where(tourist_id: @tourist.id)
    end


    def create
		@tourist = Tourist.new(tourist_params)
		if @tourist.save
		    flash[:notice] = "追加しました"
            redirect_to admins_tourists_path
        else
            @tourists = Tourist.all
            render :index
        end
    end

    def edit
        @tourist = Tourist.find(params[:id])
    end
    
    def update
        @tourist = Tourist.find(params[:id])
        if  @tourist.update(tourist_params)
            redirect_to admins_tourists_path
        else
            render :edit        
        end
    end

    def destroy
        @tourist = Tourist.find(params[:id])
        @tourist.destroy
        redirect_to admins_tourists_path
    end

private
def tourist_params
    params.require(:tourist).permit(:name, :image, :overview)
end

end