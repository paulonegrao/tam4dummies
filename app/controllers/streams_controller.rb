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

    # create Broadcast on Youtube Live Streaming
    title = "'#{@lecture.chapter}.#{@topic.number} - #{@topic.title}'"
    titlest = "tam4dummies_stream_#{Stream.maximum(:id)+1}"

    time_now  = Time.now + 60
    starttime = time_now.iso8601

    endtime = time_now + 2*60*60
    endtime = endtime.iso8601

    if !@stream.description.present?
       description = "'not informed'"
    else
       description = "'#{@stream.description}'"
    end
# t4d.sxx - Create Broadcast at Youtube

    argscreate = "#{title} #{titlest} #{starttime} #{endtime} #{description}"

    output = []
    IO.popen("java -cp /home/pi/ytlive/api-samples/java/target/samples-0.0.1-SNAPSHOT.jar com.google.api.services.samples.youtube.cmdline.live.CreateBroadcast #{argscreate}").each do |line|
         p line.chomp
         output << line.chomp
    end

    outputw = output.split('@@t4d_arg=')

    if outputw.length == 4
       @stream.broadcast_id = outputw[1]
       @stream.stream_name  = outputw[2]
       if @stream.save
          @topic = Topic.find params[:topic_id]
          redirect_to topic_stream_path(@topic, @stream), notice: "Stream created successfully"
       else
          flash[:alert] = @stream.errors.full_messages.join(", ")
          render :new
          #render "topics/#{@topics}/streams/new"
       end
    else
       flash[:alert] = "Youtube Broadcast Stream not created. Try again."
       render :new
    end
  end


  def show
    @topic = Topic.find params[:topic_id]
    @lecture = Lecture.find @topic.lecture_id
    @stream = Stream.find params[:id]
    @event = Event.last
    @take = Take.where("stream_id = ?", params[:id])
    @dummits = Dummit.all
    @dummit = Dummit.new
  end


end
