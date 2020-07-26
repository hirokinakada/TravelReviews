class PostController < ApplicationController

    before_action :authenticate_customer!, only: [:create]

    def create
        @post = Post.new(post_params)
        @post.customer_id = current_customer.id
        if  @post.save
            redirect_to topic_path(params[:post]['topic_id'])
        else
            @topic = Topic.find(params[:post][:topic_id])
            @posts = @topic.posts
            render 'topics/show'
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to topic_path(topic_id)
    end

private
    def post_params
        params.require(:post).permit(:topic_id, :customer_id, :body)
    end
end
