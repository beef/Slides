class SlideShow < ActiveRecord::Base
  has_many :slides
  
  before_save :set_url

private

  def set_url
    write_attribute :permalink, title.parameterize if permalink.blank?
  end  
end
