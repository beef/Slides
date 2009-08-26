class SlidesController < ApplicationController
  unloadable

  def index
    respond_to do |format|
      format.json  { render :json => Slide.all }
    end
  end

end
