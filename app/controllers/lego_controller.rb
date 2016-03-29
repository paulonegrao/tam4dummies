class LegoController < ApplicationController
  def ssl_configured?
    false
  end

  def baloons
  end
  def components
      @lego_page = true
  end
  def lego
      #system('rm /home/pi/rails/tam4dummies/stream/siri_housekeeper')
      system('rm /Users/paulonegrao/codecore/railsdir/tam_for_dummies_app/stream/siri_housekeeper')
      #takes = Take.find 1
      #takes.update_attributes(token: Time.now)
  end

  def lego_fix
    #byebug
      #output = system('rm /home/pi/rails/tam4dummies/stream/siri_housekeeper')
      has_housekeeper = system('rm /Users/paulonegrao/codecore/railsdir/tam_for_dummies_app/stream/siri_housekeeper')
      if has_housekeeper
        render 'lego_fix_ok'
      end
  end
end
