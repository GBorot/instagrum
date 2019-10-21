class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  include CarrierWave::MiniMagick

  # process resize_to_fit: [800, 800]

  version :thumb do
    process resize_to_fill: [50, 50]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Remove everything else
end
