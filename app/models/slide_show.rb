class SlideShow < ActiveRecord::Base
  has_many :slides
  
  before_save :set_url

  def reindex
    slides.all(:order => 'position ASC, created_at DESC').each_with_index do |slide, index|
      slide.update_attribute(:position, index)
    end
  end
  
private

  def set_url
    write_attribute :permalink, title.parameterize if permalink.blank?
  end
  
end
