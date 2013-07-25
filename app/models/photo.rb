class Photo < ActiveRecord::Base
  belongs_to :album
  has_and_belongs_to_many :tags

   # does this need to be here?
   mount_uploader :image, ImageUploader
end
