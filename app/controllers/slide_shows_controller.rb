class SlideShowsController < ApplicationController
  unloadable
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


  def show
    @slide_show = SlideShow.find_by_permalink(params[:id])
  #raise
    @slides = @slide_show.slides.published
    respond_to do |format|
      format.json  { render :json => @slides }
    end
  end
end