class TopicsController < ApplicationController
  def index
    @topics = Topic.visible_to(current_user).paginate(page: params[:page], per_page: 10)
    authorize @topics
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = Post.paginate(page: params[:page], per_page: 100)
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
    if @topic.update_attributes(topic_params)
      redirect_to @topic
    else
      flash[:error] = "ID-10-T error. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    authorize @topic
    if @topic.destroy
      flash[:notice] = "\"#{@topic.name}\" was deleted successfully"
      redirect_to topics_path
    else
      flash[:error] = "There was an error in deleting this topic"
      render :show
    end
  end

private

 def topic_params
   params.require(:topic).permit(:name, :description, :public, :user_id)
 end
end
