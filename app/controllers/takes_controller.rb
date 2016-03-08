class TakesController < ApplicationController

  def create
    @stream = Stream.find params[:stream_id]
    @take = Take.new
    @take.stream = @stream

    @take.save
    render :create_live_id

  end

  def live_stream_start    
    # kill any stream_yt.sh still running
    system('pkill -f "tam4dummies/stream/stream_yt.sh"')
 
    system("/home/pi/rails/tam4dummies/stream/stream_yt.sh #{params[:stream_name]} #{params[:broadcast_id]} &")
    @pid = $?
    render :live_stream_started
  end

end
