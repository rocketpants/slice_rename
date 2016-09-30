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

          unless config.suffixes[i].nil?
            pos_x = (x * config.width) + (x * config.padding) + ((x + 1) * config.padding)
            pos_y = (y * config.height) + (y * config.padding) + ((y + 1) * config.padding)

            if config.collapse_padding
              pos_x -= (x * config.padding)
              pos_y -= (y * config.padding)
            end

            crop = "#{config.width}x#{config.height}+#{pos_x}+#{pos_y}"
            output_name = "#{path}/#{name}#{config.suffixes[i]}#{extension}"

            if config.debug
              puts "Output: #{output_name}"
              puts "Crop: #{crop}"
            end

            save_slice image, output_name, crop
          end

          i += 1
        end
      end
    end

    private

    def self.open_image(path)
      MiniMagick::Image.open path
    end

    def self.save_slice(image, file_name, cropping)
      image.combine_options do |c|
        c.crop cropping
        c.repage.+
      end

      image.write file_name
    end
  end
end
