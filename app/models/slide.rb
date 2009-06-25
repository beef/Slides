class Slide < ActiveRecord::Base
  has_attachment :storage => :file_system, #Should be changed to S3 for production
                 :path_prefix => 'public/assets/slides', #Should be changed to S3 for production
                 :max_size => 5.megabytes,
                 :content_type => :image,
                 :resize_to => '750x422!'
                 
  named_scope :published, lambda { { :conditions => ['published_at != \'\' AND published_at < ? AND (published_to > ? OR published_to is null)', Time.now, Time.now] } }
  
  validates_presence_of :size, :content_type, :if => :has_file?
  validate              :attachment_attributes_valid?, :if => :has_file?

  attr_writer :publish, :hide
  attr_accessible :title, :date, :link, :strapline  
  
  def to_json(options = {})
    options.reverse_merge! :methods => :public_filename, :only => [:title, :strapline, :link, :date]
    super options
  end
  
  private
  
  before_save :set_published
  
  def has_file?
    filename != 'no_file'
  end
  
  def set_published
    write_attribute :published_at, Time.now if @publish
    if @hide    
      write_attribute :published_at, nil 
      write_attribute :published_to, nil 
    end
  end

end
