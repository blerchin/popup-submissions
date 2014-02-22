# encoding: utf-8

class SlideUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  #include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  #storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

	# limit file size to prevent attacks/server collapse
	 def pre_limit file
    #require 'debugger'; debugger
    if file && file.size > 10.megabytes
      raise Exception.new("File too large to process.")
    end
    true
  end	

	#don't try to process each frame of a gif, it will end in tears
  def only_first_frame
		manipulate! do |img|
 
			if img.mime_type.match /gif/
				img.collapse!
			end
			img
		end
	end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
	version :original

	version :large, if: :pre_limit do
		process :only_first_frame
		process :convert => 'jpg'
		process :resize_to_fit => [1280, 1280]
	end
	version :medium, 
								:if => :pre_limit,
								:from_version => :large do
		process :resize_to_fit => [600, 600]
	end
  version :thumb, 
								:if => :pre_limit,
								:from_version => :medium do
    process :resize_to_fill => [100, 100]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  #For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
