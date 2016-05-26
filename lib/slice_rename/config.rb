require 'yaml'

module SliceRename
  class Config
    attr_accessor :path, :debug
    attr_reader :rows, :columns, :width, :height

    def initialize
      @path = ''
      @debug = false
      @rows = 1
      @columns = 1
      @width = 16
      @height = 16
      @suffixes = []
    end

    def load(config_path)
      config = YAML::load_file(File.join(config_path)).fetch('slice_rename_config', {})

      puts config.inspect

      @rows = config.fetch('rows', @rows)
      @columns = config.fetch('columns', @columns)
      @width = config.fetch('width', @width)
      @height = config.fetch('height', @height)
      @suffixes = config.fetch('suffixes', @suffixes)
    end
  end
end
