class SiriController < ApplicationController
  def ssl_configured?
    false
  end

  def housekeeper
    system('touch /home/pi/rails/tam4dummies/stream/siri_housekeeper')
    format.js { render :siri_ok }
  end

end
