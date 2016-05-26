require 'optparse'

require 'slice_rename/config'
require 'slice_rename/slicer'

module SliceRename
  class Cli
    def self.perform
      config = SliceRename::Config.new

      parser = OptionParser.new do |opts|
        opts.banner = "Usage: file [options]"

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

      SliceRename::Slicer.slice_image config
    end
  end
end
