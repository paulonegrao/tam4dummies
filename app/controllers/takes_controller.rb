class TakesController < ApplicationController

  def create
    @stream = Stream.find params[:stream_id]
    @take = Take.new
    @take.stream = @stream

    @take.save
    render :create_live_id

  end

  def live_stream_start
    tam_batch_envelope = '/home/pi/rails/tam4dummies/stream/tam4dummies_stream.sh'
    tam_batch_stream_yt = '/home/pi/rails/tam4dummies/stream/stream_yt.sh'
    #system(tam_batch_envelope tam_batch_stream_yt)
    render :live_stream_started
  end

end
