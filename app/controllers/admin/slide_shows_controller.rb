class Admin::SlideShowsController < Admin::BaseController
  sortable_attributes :title, :permalink 

  # GET /slide_shows
  # GET /slide_shows.xml
  def index
    @slide_shows = SlideShow.paginate :page => params[:page], :order => sort_order

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @slide_shows }
    end
  end

  # GET /slide_shows/1
  # GET /slide_shows/1.xml
  def show
    @slide_show = SlideShow.find(params[:id])

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @slide_show }
    end
  end

  # GET /slide_shows/new
  # GET /slide_shows/new.xml
  def new
    @slide_show = SlideShow.new

    respond_to do |format|
      format.html { render :action =>'show' }
      format.xml  { render :xml => @slide_show }
    end
  end

  # POST /slide_shows
  # POST /slide_shows.xml
  def create
    @slide_show = SlideShow.new(params[:slide_show])

    respond_to do |format|
      if @slide_show.save
        flash[:notice] = 'SlideShow was successfully created.'
        format.html { redirect_to(admin_slide_shows_url) }
        format.xml  { render :xml => @slide_show, :status => :created, :location => @slide_show }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @slide_show.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /slide_shows/1
  # PUT /slide_shows/1.xml
  def update
    @slide_show = SlideShow.find(params[:id])

    respond_to do |format|
      if @slide_show.update_attributes(params[:slide_show])
        flash[:notice] = 'SlideShow was successfully updated.'
        format.html { redirect_to(admin_slide_shows_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @slide_show.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /slide_shows/1
  # DELETE /slide_shows/1.xml
  def destroy
    @slide_show = SlideShow.find(params[:id])
    @slide_show.destroy
    flash[:notice] = 'SlideShow was successfully deleted.'

    respond_to do |format|
      format.html { redirect_to(admin_slide_shows_url) }
      format.xml  { head :ok }
    end
  end
end
