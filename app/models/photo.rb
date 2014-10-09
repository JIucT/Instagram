class Photo < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, :styles => { medium: "200x200#", thumb: "100x100#", large: "372x349#" }

  validates_attachment_presence :image
  validates_attachment_file_name :image, :matches => [/png\Z/i, /jpe?g\Z/i, /gif\Z/i]
end
