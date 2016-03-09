class TimelinesController < ApplicationController

  def tameline

    @streams = Stream.all

    respond_to do |format|

        format.html { render :tameline }
        format.json { render :tameline }

    end
  end

end
