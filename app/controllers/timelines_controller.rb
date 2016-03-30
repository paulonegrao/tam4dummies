class TimelinesController < ApplicationController
  before_action :authenticate_user, except: [:ssl_configured?]

  def tameline
    respond_to do |format|
      format.html { render :tameline }

      format.json {
        @streams = Stream.all
        render :tameline
      }
    end
  end

  def play_again_tam
    respond_to do |format|
      format.html {
          @params_patam = params
          render :play_again_tam
      }
      format.json {
          @broadcast_id = params[:broadcast_id]
          @description = params[:description]

          @headline = "#{params[:lecture_chapter]}.#{params[:topic_number]} #{params[:lecture_subject]} / #{params[:topic_title]}"

          @dummits = Dummit.where(stream_id: params[:stream_id], user_id: current_user.id)
          render :play_again_tam
      }
    end
  end

end
