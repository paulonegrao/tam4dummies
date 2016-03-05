class TakesController < ApplicationController

  def create
    @stream = Stream.find params[:stream_id]
    @take = Take.new
    @take.stream = @stream

    @take.save
    render :create_live_id

  end

  def live_stream_start    
    system('/home/pi/rails/tam4dummies/stream/stream_yt.sh &')
    @pid = $?
    render :live_stream_started
  end

end
