class Slide < ActiveRecord::Base
  acts_as_publishable
  acts_as_list :insert_position => :top
  has_attachment :storage => :file_system, #Should be changed to S3 for production
                 :path_prefix => 'public/assets/slides', #Should be changed to S3 for production
                 :max_size => 5.megabytes,
                 :content_type => :image,
                 :resize_to => resize_to
                   
  validates_presence_of :size, :content_type, :if => :has_file?
  validate              :attachment_attributes_valid?, :if => :has_file?
  
  cattr_accessor :resize_to
  attr_accessible :title, :date, :link, :strapline, :publish, :hide, :uploaded_data

  default_scope :order => 'position ASC'

  def to_json(options = {})
    options.reverse_merge! :methods => :public_filename, :only => [:title, :strapline, :link, :date]
    super options
  end

private
  def reindex
    if self.created_at == self.updated_at #i.e. a new record
      Slide.all(:order => 'position ASC, created_at DESC', :conditions => ['id != ', self.id]).each_with_index do |slide, index|
        slide.update_attribute(:position, index)
      end
    end
  end
  
  def has_file?
    filename != 'no_file'
  end
end
