class TopicsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  before_action :find_topic, only: [:show, :edit, :update, :destroy]

  before_action :authorize, only: [:edit, :update, :destroy]

  def ssl_configured?
    false
  end

  def index
    redirect_to lectures_path
  end

  def new
      @lectures = Lecture.all
      @topic = Post.new
  end

  def create
    @lecture       = Lecture.find(params[:selected_lecture])
    @topic           = Topic.new(topic_params)
    @topic.lecture  = @lecture
    #@topic.user      = current_user
    if @topic.save
      redirect_to topic_path(@topic), notice: "Topic created successfully"
    else
      @lecture = Lecture.all
      render :new
    end
  end

  def show
    @stream = Stream.new
    # @post.comments.sort { |a,b| a.created_at <=> b.created_at }
    # using database command instead to speed up
    @topic_streams = @topic.streams.order(created_at: :DESC)
  end

  def edit
    @lecture = Lecture.all
    redirect_to root_path, alert: "Access denied." unless can? :edit, @topic
  end

  def update
    @lecture = Lecture.find(params[:selected_lecture])
    @topic.lecture = @lecture
    if @topic.update(topic_params)
      redirect_to topic_path(@topic) , notice: "Topic updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to lectures_path, notice: "Topic deleted successfully"
  end

private

  def post_params
    topic_params = params.require(:topic).permit([:number, :title])

  end

  def find_topic
    @topic = Topic.find params[:id]
  end

  def authorize
     redirect_to lectures_path, alert: "Access denied!" unless can? :manage, @topic
  end

end
