class HomeController < ApplicationController
    def top
        @tourists = Tourist.page(params[:page]).reverse_order.per(6)
    end

    def about

    end
end
