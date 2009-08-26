class SlideShowsController < ApplicationController
  # GET /slide_shows
  # GET /slide_shows.xml
  def index
    @slide_shows = SlideShow.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @slide_shows }
      format.json  { render :json => @slide_shows }
    end
  end

end