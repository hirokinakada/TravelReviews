class PostController < ApplicationController
    def create
        @post = Post.new(post_params)
        @post.customer_id = current_customer.id
        @post.save
        redirect_to topics_show_path(params[:post]['topic_id'])
    end

private
    def post_params
        params.require(:post).permit(:topic_id, :customer_id, :body)
    end
end
