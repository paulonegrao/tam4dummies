class DummitsController < ApplicationController
  #before_action :authenticate_user, except: [:index, :show]

  #before_action :find_dummit, only: [:show, :edit, :update, :destroy]

  # before_action :authorize, only: [:edit, :update, :destroy]


  def create
    @stream         = Stream.find(params[:stream_id])
    @dummit         = Dummit.new(dummit_params)
    @dummit.stream  = @stream
    @dummit.user    = current_user

    respond_to do |format|
      if @dummit.save
        format.js { render :create_success }
      else
        format.js { render :create_failure }
      end
    end
  end


  def dummit_params
    dummit_params = params.require(:dummit).permit([:title, :body])
  end

  def find_dummit
    @dummit = Dummit.find params[:id]
  end

  # def authorize
  #    redirect_to categories_path, alert: "Access denied!" unless can? :manage, @dummit
  # end

end
