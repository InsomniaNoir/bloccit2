class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    authorize @topics
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def show
    @topic = Topic.find(params[:id])
    @post = @topic.posts
    authorize @topic
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def create
    @topic = current_user.topics.build(topic_params)
    authorize @topic
    if @topic.save
      redirect_to @topic, notice: "Topic was saved successfully."
    else
      flash[:error] = "ID-10-T error. Please try again."
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:id])
    authorize @topic
    if current_user.topics.build(topic_params)
      redirect_to :edit
    else
      flash[:error] = "ID-10-T error. Please try again."
      render :edit
    end
  end
end

private

def topic_params
  params_require(:topic).permit(:name, :description, :publics)
end
