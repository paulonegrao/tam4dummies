class LecturesController < ApplicationController
#  def ssl_configured?
#    false
#  end

  def index
    @lectures = Lecture.all.order("chapter ASC")
  end

  def new
    @lecture = Lecture.new
  end

  def create
    lecture_params = params.require(:lecture).permit(:chapter)
    @lecture = Lecture.new(lecture_params)
    if @lecture.save
      redirect_to lectures_path, notice: "Lecture created"
    else
      render :new
    end
  end

  def edit
    @lecture = Lecture.find(params[:id])
  end

  def update
    lecture_params = params.require(:lecture).permit(:chapter)
    @lecture = Lecture.find(params[:id])
    if @lecture.update(lecture_params)
      redirect_to lectures_path, notice: "Lecture updated"
    else
      render :edit
    end
  end

  def destroy
    @lecture = Lecture.find(params[:id])
    @lecture.destroy
    flash[:notice] = "Lecture deleted"
    redirect_to lectures_path
  end

end
