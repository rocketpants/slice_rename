require 'optparse'

require 'slice_rename/config'
require 'slice_rename/slicer'
require 'slice_rename/combiner'

module SliceRename
  class Cli
    def self.perform
      config = SliceRename::Config.new
      combine = false

      parser = OptionParser.new do |opts|
        opts.banner = "Usage: file [options]"

        opts.on("-c", "--config MANDATORY", "A YAML file that contains the slice and name configuration") do |v|
          config.load v
        end

        opts.on("-k", "--combine", "Combine the images instead of slicing them") do |v|
          combine = true
        end

        opts.on("-f", "--fallback [FALLBACK]", "A base name used if a file can't be found") do |v|
          config.fallback = v
        end

        opts.on("-d", "--debug", "Output debug info") do |v|
          config.debug = true
        end

        opts.on("-v", "--version", "Display the version") do |v|
          puts VERSION
          exit
        end

        opts.on("-h", "--help", "Display this message") do |v|
          puts opts
          exit
        end
      end

      begin parser.parse! ARGV
      rescue OptionParser::InvalidOption => e
        puts e
        puts parser
        exit 1
      end

      arguments = parser.order ARGV
      if arguments.empty?
        puts 'Please specify an input file name.'
        puts parser
        exit 1
      else
        config.path = arguments.first
      end

      if combine
        SliceRename::Combiner.combine_images config
      else
        SliceRename::Slicer.slice_image config
      end
    end
  end
end
