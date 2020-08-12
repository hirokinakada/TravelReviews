class CustomersController < ApplicationController

    before_action :authenticate_customer!, only: [:edit,:update]

    before_action :correct_customer, only: [:edit, :update]

    def show
        @customer = Customer.find(params[:id])
        @reviews = Review.where(customer_id: @customer.id)
        @spots = @customer.like_spots #likeしたものだけ取得
    end

    def edit
        @customer = Customer.find(params[:id])
    end

    def update
        @customer = Customer.find(params[:id])
        if @customer.update(customer_params)
            redirect_to customer_path(@customer.id)
        else
            render "edit"
        end
    end

private
    def customer_params
        params.require(:customer).permit(:nickname, :image)
    end

    def correct_customer
        unless params[:id].to_i == current_customer.id
              redirect_to customer_path(current_customer)
          end
    end

end

