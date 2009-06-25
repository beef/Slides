class SlidesController < ApplicationController

  def index
    respond_to do |format|
      format.json  { render :json => Slide.published.all }
    end
  end

end
