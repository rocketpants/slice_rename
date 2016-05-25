require 'mini_magick'

module SliceRename
  class Cli
    def self.perform
      puts "Welcome to Slice Rename #{VERSION}!"

      # Input that should come from the command line.
      image_name = 'char2'

      # Configuration that should be loaded from a file.
      rows = 5
      columns = 4
      width = 15
      height = 37
      suffixes = [
        '_idle_00',
        '_idle_01',
        '_idle_02',
        '_idle_03',
        '_walking_00',
        '_walking_01',
        '_walking_02',
        '_walking_03',
        '_walking_04',
        '_walking_05',
        '_walking_06',
        '_walking_07',
        '_walking_08',
        '_walking_09',
        '_walking_10',
        '_walking_11',
        '_walking_12',
        '_walking_13',
        '_walking_14',
        '_walking_15'
      ]

      i = 0
      for y in 0..(rows - 1)
        for x in 0..(columns - 1)
          # Not sure why we need to reload the image each time.
          image = MiniMagick::Image.open("input/#{image_name}.png")

          crop = "#{width}x#{height}+#{x * width}+#{y * height}"
          name = "output/#{image_name}#{suffixes[i]}.png"

          # Provide a debug option for this output.
          puts crop
          puts name

          image.crop crop
          image.write name
          i += 1
        end
      end
    end
  end
end
