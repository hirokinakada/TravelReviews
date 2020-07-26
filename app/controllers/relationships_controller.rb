class RelationshipsController < ApplicationController
    def follows
        @customers = Customer.find(params[:customer_id]).following_customer
    end
    
    def followers
        @customers = Customer.find(params[:customer_id]).follower_customer
    end
    
    def follow
        current_customer.follow(params[:id])
        redirect_back(fallback_location: customer_path(current_customer))
    end
    
    def unfollow
        current_customer.unfollow(params[:id])
        redirect_back(fallback_location: customers_path(current_customer))
    end
end
