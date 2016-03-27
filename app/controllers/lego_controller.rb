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
      takes = Take.find 1
      takes.update_attributes(token: Time.now)
  end
end
