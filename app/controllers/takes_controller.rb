class TakesController < ApplicationController

  def create
    @stream = Stream.find params[:stream_id]
    @take = Take.new
    @take.stream = @stream

    @take.save
    render :create_live_id

  end

  def live_stream_start
    byebug
    tam_batch_envelope = '/home/pi/rails/tam4dummies/stream/tam4dummies_stream.sh'
    tam_batch_stream_yt = '/home/pi/rails/tam4dummies/stream/stream_yt.sh'
    system(tam_batch_envelope tam_batch_stream_yt)
  end

  def live_stream_stop
    tam_batch_pid = '/home/pi/rails/tam4dummies/stream/run/stream_yt.sh.pid'
    system('sudo kill -9 cat' tam_batch_pid)
  end

end
