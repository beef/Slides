class SlidesController < ApplicationController

  def index
    if params[:slide_show_id].blank?
      @slides = Slide.published
    else
      @slideshow = SlideShow.find_by_permalink(params[:slide_show_id])
      @slides = @slideshow.slides.published
    end
    
    respond_to do |format|
      format.json  { render :json => @slides }
    end
  end

end
