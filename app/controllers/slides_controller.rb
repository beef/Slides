class SlidesController < ApplicationController

  def index
    respond_to do |format|
      format.json  { render :json => Slide.published }
    end
  end

end
