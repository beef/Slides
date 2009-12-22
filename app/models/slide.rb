class Slide < ActiveRecord::Base
  acts_as_publishable
  acts_as_list :scope => :slide_show_id
  has_attachment :storage => :file_system, #Should be changed to S3 for production
                 :path_prefix => 'public/assets/slides', #Should be changed to S3 for production
                 :max_size => 5.megabytes,
                 :content_type => :image
                   
  validates_presence_of :size, :content_type, :if => :has_file?
  validate              :attachment_attributes_valid?, :if => :has_file?
  belongs_to :slide_show

  attr_accessible :slide_show_id, :title, :date, :link, :strapline, :publish, :hide, :uploaded_data, :body, :published_at, :published_to

  default_scope :order => 'position ASC'

  before_save :correct_url
  
  def to_json(options = {})
    options.reverse_merge! :methods => :public_filename, :only => [:title, :strapline, :link, :date]
    super options
  end

private
  def has_file?
    filename != 'no_file'
  end
  
  
  def correct_url
    write_attribute :link, self.link.gsub(/^http\:\/\//i,'') unless self.link.nil?
  end
end
