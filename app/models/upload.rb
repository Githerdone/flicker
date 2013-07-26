require 'carrierwave'
require 'mini_magick'

class Upload < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

    after :store, :clear_cache

  # remember the tmp file
 
  
  def clear_cache(variable)
    CarrierWave.clean_cached_files!
  end
  # before :store, :remember_cache_id
  # after :store, :delete_tmp_dir

  # # store! nil's the cache_id after it finishes so we need to remember it for deletion
  # def remember_cache_id(new_file)
  #   @cache_id_was = cache_id
  # end

  # def delete_tmp_dir(new_file)
  #   # make sure we don't delete other things accidentally by checking the name pattern
  #   if @cache_id_was.present? && @cache_id_was =~ /\A[\d]{8}\-[\d]{4}\-[\d]+\-[\d]{4}\z/
  #     FileUtils.rm_rf(File.join(root, cache_dir, @cache_id_was))
  #   end
  # end

   def store_dir
    'public/images'
  end



# process :resize_to_fill => [200, 200]

  # def store_dir
  #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # resize_to_limit(1024, 768)

   # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  # def store_dir
  #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end

  # version :large do
  #   # process :crop
  # end
  # version :thumb do
  #   # process :crop
  #   resize_to_fill(100, 100)
  # end
  
  # Process files as they are uploaded:
  process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
    process :scale => [50, 50]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  # version :large do
  #   process :crop
  # end

  # version :preview do
  #   process :crop
  #   resize_to_limit(690, 518)
  # end

  # version :thumb do
  #   process :crop
  #   resize_to_fill(100, 100)
  # end


  # def crop
  #   if model.crop_x.present?
  #     manipulate! do |img|
  #       x = model.crop_x.to_i
  #       y = model.crop_y.to_i
  #       w = model.crop_w.to_i
  #       h = model.crop_h.to_i
  #       img = img.crop(x, y, w, h)
  #       img
  #     end
  #   end
  # end

  # def convert_to_grayscale
  #   manipulate! do |img|
  #     img.colorspace = Magick::GRAYColorspace
  #     img
  #   end
  # end

  # def brightness
  #   manipulate! do |img|
  #     img.modulate(1.20, 0.5, 1.2)
  #   end
  # end

end