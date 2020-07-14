class Admins::TouristsController < ApplicationController

    def index
        @tourists = Tourist.all
        @tourist = Tourist.new
    end

    def show
        @tourist = Tourist.find(params[:id])
    end


    def create
		@tourist = Tourist.new(tourist_params)
		@tourist.save
		flash[:notice] = "追加しました"
		redirect_to admins_tourists_path
    end

    def edit
        @tourist = Tourist.find(params[:id])
    end
    
    def update
        @tourist = Tourist.find(params[:id])
        @tourist.update(tourist_params)
        flash[:notice] = "変更しました"
        redirect_to admins_tourists_path
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