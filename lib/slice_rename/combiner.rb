require 'mini_magick'

module SliceRename
  class Combiner
    def self.combine_images(config)
      extension = File.extname config.path
      name = File.basename config.path, extension
      path = File.dirname config.path

      images = []
      output_name = "#{path}/#{name}#{extension}"
      geometry = "#{config.width}x#{config.height}\>+0+0"
      border = "#{config.padding}x#{config.padding}"
      tile = "#{config.columns}x#{config.rows}"

      config.suffixes.each do |suffix|
        if suffix != nil
          images << "#{path}/#{name}#{suffix}#{extension}"
        else
          images << 'null:'
        end
      end

      if config.debug
        puts "Input: #{images.join(', ')}"
        puts "Output: #{output_name}"
        puts "Geometry: #{geometry}"
      end

      save_combination(images, output_name, geometry, tile, border)
    end

    private

    def self.open_image(path)
      MiniMagick::Image.open path
    end

    def self.save_combination(input_names, output_name, geometry, tile, border)
      MiniMagick::Tool::Montage.new do |montage|
        input_names.each do |file_name|
          montage << file_name
        end

        montage.geometry geometry
        montage.tile tile
        montage.border border
        montage.bordercolor "none"
        montage.background "none"
        montage << output_name
      end
    end
  end
end
