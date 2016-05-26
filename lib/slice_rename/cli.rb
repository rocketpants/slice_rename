require 'mini_magick'
require 'slice_rename/config'
require 'slice_rename/slicer'

module SliceRename
  class Cli
    def self.perform
      puts "Welcome to Slice Rename #{VERSION}!"

      config = SliceRename::Config.new
      SliceRename::Slicer.slice_image 'spec/fixtures/char2.png', config
    end
  end
end
