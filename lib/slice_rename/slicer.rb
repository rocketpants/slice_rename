require 'mini_magick'

module SliceRename
  class Slicer
    def self.slice_image(config)

      extension = File.extname config.path
      name = File.basename config.path, extension
      path = File.dirname config.path

      i = 0
      for y in 0..(config.rows - 1)
        for x in 0..(config.columns - 1)
          # Not sure why we need to reload the image each time.
          image = open_image config.path

          crop = "#{config.width}x#{config.height}+#{x * config.width}+#{y * config.height}"
          output_name = "#{path}/#{name}#{config.suffixes[i]}#{extension}"

          if config.debug
            puts crop
            puts output_name
          end

          save_slice image, output_name, crop

          i += 1
        end
      end
    end

    private

    def self.open_image(path)
      MiniMagick::Image.open path
    end

    def self.save_slice(image, file_name, cropping)
      image.crop cropping
      image.write file_name
    end
  end
end
