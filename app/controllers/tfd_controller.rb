class TfdController < ApplicationController
  # stream


  def serve

      # path = Rails.root.to_s+'/app/assets/images/'+params[:name]+'.mov'
      path = '/Users/paulonegrao/Documents/'+params[:name]+'.mov'

      send_file( path,
        :disposition => 'inline',
        :type        => 'video/quicktime',
        :x_sendfile  => true )
      # send_file File.join('/var/log',params[:name]+'.mov'), :disposition => 'inline', :type => 'video/quicktime'
  end
end
