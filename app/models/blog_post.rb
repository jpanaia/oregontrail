class BlogPost < ActiveRecord::Base
	has_attached_file :photo, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
	
	geocoded_by :address   
    after_validation :geocode

	has_many :comments
	belongs_to :user

  def next
    BlogPost.where("id > ?", id).first
  end

  def prev
    BlogPost.where("id < ?", id).last 
  end
	
end
