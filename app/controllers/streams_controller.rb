class StreamsController < ApplicationController
  def index
    @stream = Stream.all.order("timestamp ASC")
  end

  def new
    @stream = Stream.new
    @topic = Topic.find params[:topic_id]
    @lecture = Lecture.find @topic.lecture_id
  end

  def create
    @topic = Topic.find params[:topic_id]
    stream_params = params.require(:stream).permit(:timestamp, :description)
    @stream = Stream.new stream_params
    @stream.topic = @topic
    @lecture = Lecture.find @topic.lecture_id
    @stream.lecture = @lecture
    @stream.timestamp = "#{Time.parse(DateTime.now.to_s)}"
    if @stream.save
      # create the Broadcsat at Youtube Live
# byebug
#       args = "--broadcast-title testetam"
#       check_results = `python /Users/paulonegrao/codecore/railsdir/tam_for_dummies_app/app/views/events/yt_setup.py --broadcast-title testetam`
#       # check_results = system("python /Users/paulonegrao/codecore/railsdir/tam_for_dummies_app/app/views/events/yt_setup.py #{args}")
      # puts check_results # => 'OK!'

      #render text: "#{@topic.title} #{@stream.lecture_id}"
        @topic = Topic.find params[:topic_id]
        redirect_to topic_stream_path(@topic, @stream), notice: "Stream created successfully"
    else
        flash[:alert] = @stream.errors.full_messages.join(", ")
        render :new
        #render "topics/#{@topics}/streams/new"
    end


  end

  def show

    @topic = Topic.find params[:topic_id]
    @lecture = Lecture.find @topic.lecture_id
    @stream = Stream.find params[:id]
    @event = Event.last

  end
end
