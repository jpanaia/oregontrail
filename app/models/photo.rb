class Photo < ActiveRecord::Base
  has_attached_file :photo, :styles => { :small => "150x150>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  belongs_to :blog_post
end