require 'yaml'

module SliceRename
  class Config
    attr_accessor :path, :debug, :fallback
    attr_reader :rows, :columns, :width, :height, :padding, :collapse_padding,
                :padding_color, :background_color, :full_grid

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
      @padding_color = 'none'
      @full_grid = true
      @background_color = 'none'
      @fallback = ''
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
      @padding_color = config.fetch('padding_color', @padding_color)
      @full_grid = config.fetch('full_grid', @full_grid)
      @background_color = config.fetch('background_color', @background_color)
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
