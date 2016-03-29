class SiriController < ApplicationController
  def ssl_configured?
    false
  end

  def housekeeper
    if running_rpi?
        system('touch /home/pi/rails/tam4dummies/stream/siri_housekeeper')
    else
        system('touch /Users/paulonegrao/codecore/railsdir/tam_for_dummies_app/stream/siri_housekeeper')
    end

    render :siri_ok
  end

end
