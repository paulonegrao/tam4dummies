class StreamsController < ApplicationController

  protect_from_forgery except: :capture_tam

  before_action only: [:show] do
      ssl_configured?(true)
  end

  before_action :authenticate_user, except: [:index, :capture_tam, :start_yt_live]

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
    if Stream.maximum(:id)
        titlest = "tam4dummies_stream_#{Stream.maximum(:id)+1}"
    else
        titlest = "tam4dummies_stream_1"
    end

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

    if @stream.save
       # call create_broadcast.sh
       
       cookies[:broadcast_id] = ""

       if running_rpi?
          system("/home/pi/rails/tam4dummies/stream/create_broadcast_yt.sh #{@stream.id} #{title} #{titlest} #{starttime} #{endtime} #{description} &")
       else
         system("/Users/paulonegrao/codecore/railsdir/tam_for_dummies_app/stream/create_broadcast_yt_lh.sh #{@stream.id} #{title} #{titlest} #{starttime} #{endtime} #{description} &")
       end

       @topic = Topic.find params[:topic_id]
       redirect_to topic_stream_url(@topic, @stream, :protocol => 'https', :port => "#{running_rpi? ? 3001 : 3001}"), notice: "Stream created successfully"
    else
       flash[:alert] = @stream.errors.full_messages.join(", ")
       render :new
    end

  end


  def show
    @topic = Topic.find params[:topic_id]
    @lecture = Lecture.find @topic.lecture_id
    @stream = Stream.find params[:id]
    @event = Event.last
    # @take = Take.where("stream_id = ?", params[:id])
    @dummits = Dummit.where(stream_id: params[:stream_id], user_id: current_user.id)
    @dummit = Dummit.new
  end


  def capture_tam
    @stream = Stream.find params[:id]
    if @stream.update_attributes(:capture_date => Time.now)
        render :capture_tam_live
    else
        render :capture_tam_error
    end
  end


  def start_yt_live
# t4d.s09 - call "stream_yt.sh" to initiate Stream to Youtube Live Streaming
    # kills any stream_yt.sh leftovers still running
    # system('pkill -f "tam4dummies/stream/stream_yt.sh"')

    system("/home/pi/rails/tam4dummies/stream/stream_yt.sh #{params[:stream_name]} #{params[:broadcast_id]} &")
    @pid = $?
    render :start_yt_live_on
  end

  private

    def stream_params
      params.require(:stream).permit([:timestamp, :description, :broadcast_id, :stream_name, :capture_date])
    end

end
