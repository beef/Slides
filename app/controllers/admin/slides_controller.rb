class Admin::SlidesController < Admin::BaseController
  sortable_attributes :position, :title, :published_at, :published_to
  
  # GET /slides
  # GET /slides.xml
  def index
    @slides = Slide.paginate :page => params[:page], :order => sort_order

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @slides }
    end
  end

  # GET /slides/1
  # GET /slides/1.xml
  def show
    @slide = Slide.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @slide }
    end
  end

  # GET /slides/new
  # GET /slides/new.xml
  def new
    @slide = Slide.new

    respond_to do |format|
      format.html { render :action => "show" }
      format.xml  { render :xml => @slide }
    end
  end

  # POST /slides
  # POST /slides.xml
  def create
    @slide = Slide.new(params[:slide])
    
    respond_to do |format|
      if @slide.save
        flash[:notice] = 'Slide was successfully created.'
        format.html { redirect_to(admin_slides_url) }
        format.xml  { render :xml => @slide, :status => :created, :location => @slide }
      else
        format.html { render :action => "show" }
        format.xml  { render :xml => @slide.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /slides/1
  # PUT /slides/1.xml
  def update
    @slide = Slide.find(params[:id])
    
    respond_to do |format|
      if @slide.update_attributes(params[:slide])
        flash[:notice] = 'Slide was successfully updated.'
        format.html { redirect_to(admin_slides_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "show" }
        format.xml  { render :xml => @slide.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /slides/1
  # DELETE /slides/1.xml
  def destroy
    @slide = Slide.find(params[:id])
    @slide.destroy

    respond_to do |format|
      format.html { redirect_to(admin_slides_url) }
      format.xml  { head :ok }
    end
  end
  
  
  def move_up
    @slide = Slide.find(params[:id])
    @slide.move_higher
    @slide.save
    
    respond_to do |format|
      format.html { redirect_to :back }
      format.xml  { render :xml => @slide }
    end
  end
  
  def move_down
    @slide = Slide.find(params[:id])
    @slide.move_lower
    @slide.save
    
    respond_to do |format|
      format.html { redirect_to :back }
      format.xml  { render :xml => @slide }
    end
  end
end
