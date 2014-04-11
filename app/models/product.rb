class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true

  has_attached_file :image, :styles =>{:thumb => "100x100>", :medium => "300x300>"}
  validates_attachment_content_type :image,
                                    :content_type => /^image\/(png|gif|jpeg)/,
                                    :message => 'only (png/gif/jpeg) images'
end
