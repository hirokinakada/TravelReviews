class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @newtopic = Topic.new
  end

  def create
    @newtopic = Topic.new(topic_params)
    @newtopic.customer_id = current_customer.id
    if  @newtopic.save
        redirect_to topics_path
    else
      @topics = Topic.all
      render :index
    end

  end


  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path
  end

  def show
    @topic = Topic.find(params[:id])
    @post = Post.new(topic_id: params[:id])
    @posts = Post.where(topic_id: params[:id])
  end

 private
 def topic_params
  params.require(:topic).permit(:title, :customer_id)
 end
end