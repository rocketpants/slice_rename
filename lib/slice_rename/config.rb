require 'yaml'

module SliceRename
  class Config
    attr_accessor :path, :debug
    attr_reader :rows, :columns, :width, :height, :padding, :collapse_padding

    def initialize
      @path = ''
      @debug = false
      @rows = 1
      @columns = 1
      @width = 16
      @height = 16
      @padding = 0
      @suffixes = []
      @collapse_padding = false
    end

    def load(config_path)
      config = YAML::load_file(File.join(config_path)).fetch('slice_rename_config', {})

      @rows = config.fetch('rows', @rows)
      @columns = config.fetch('columns', @columns)
      @width = config.fetch('width', @width)
      @height = config.fetch('height', @height)
      @padding = config.fetch('padding', @padding)
      @suffixes = config.fetch('suffixes', @suffixes)
      @collapse_padding = config.fetch('collapse_padding', @collapse_padding)
    end

    def suffixes
      count = @rows * @columns

      if @suffixes.empty?
        @suffixes = []

        for i in 0..(count - 1)
          @suffixes[i] = "_%02d" % (i + 1)
        end
      end

      @suffixes
    end
  end
end
