module SliceRename
  class Slicer
    def self.slice_image(full_path, config)

      extension = File.extname full_path
      name = File.basename full_path, extension
      path = File.dirname full_path

      i = 0
      for y in 0..(config.rows - 1)
        for x in 0..(config.columns - 1)
          # Not sure why we need to reload the image each time.
          image = open_image full_path

          crop = "#{config.width}x#{config.height}+#{x * config.width}+#{y * config.height}"
          output_name = "#{path}/#{name}#{config.suffixes[i]}#{extension}"

          # Provide a debug option for this output.
          puts crop
          puts output_name

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
