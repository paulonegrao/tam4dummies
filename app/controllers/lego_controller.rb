class LegoController < ApplicationController

  def baloons
  end

  def components
      @lego_page = true
  end

  def lego
    if running_rpi?
        system('rm /home/pi/rails/tam4dummies/stream/siri_housekeeper')
    else
        system('rm /Users/paulonegrao/codecore/railsdir/tam_for_dummies_app/stream/siri_housekeeper')
    end
      #takes = Take.find 1
      #takes.update_attributes(token: Time.now)
  end

  def lego_fix

      if running_rpi?
          has_housekeeper = system('rm /home/pi/rails/tam4dummies/stream/siri_housekeeper')
      else
          has_housekeeper = system('rm /Users/paulonegrao/codecore/railsdir/tam_for_dummies_app/stream/siri_housekeeper')
      end
      if has_housekeeper
        format.js { render :json => 'lego_fix' }
      end
  end
end
