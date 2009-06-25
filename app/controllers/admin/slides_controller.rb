class Admin::SlidesController < Admin::BaseController
  # GET /slides
  # GET /slides.xml
  def index
    @slides = Slide.all

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
    
    if current_user.authorised?(1)
      @slide.publish = params[:commit] == 'Go Live'
    else
      @slide.publish = false
    end

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
    
    if current_user.authorised?(1)
      case params[:commit]
      when 'Go Live'
        @slide.publish = true
      when 'Save as Draft'
        @slide.hide = true
      end
    end

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
end
