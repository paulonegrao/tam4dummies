class LegoController < ApplicationController

  def balloon1
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

      respond_to do |format|
        if has_housekeeper
          format.js { render :lego_fix_fixed }
        else
          format.js { render :lego_fix_dropped }
        end
      end
  end
end
