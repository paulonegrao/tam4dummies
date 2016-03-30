class EventsController < ApplicationController
  #before_action :keep_alive, only: [:update]
#  def ssl_configured?
#    false
#  end

  def index
    @lectures = Lecture.all
    @topics = Topic.where("lecture_id = ?", Lecture.first.id)
  end

  # def show
  #   @topic = Topic.find_by("id = ?", params[:trip][:topic_id])
  # end

  # def update_topics
  #   @topics = Topic.where("lecture_id = ?", params[:lecture_id])
  #   respond_to do |format|
  #     format.js
  #   end
  # end

  def update
    @event = Event.last
    respond_to do |format|
      # @event.update(event_params)
      attr_update = event_params
      attr_update[:updated_at] = Time.now
      if @event.update_attributes(attr_update)
# t4d.s03 - TOUCH "tam_keep_alive"; live_id=0; live_yt_id=resquest_path
        system('touch /home/pi/rails/tam4dummies/stream/tam_keep_alive &')
	      format.html
        format.js { render :update_success }
      else
        format.html
        format.js { render :update_error }
      end
    end
  end

# t4d.s03 - find last (and unic) Event and passes it to show.js.erb (on events view)
  def show
    @event = Event.last
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

    def keep_alive
      @event = Event.all
    end

    def event_params
      params.require(:event).permit([:live_id, :live_capture_date, :live_yt_id])
    end

end
