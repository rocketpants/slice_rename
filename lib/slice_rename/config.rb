module SliceRename
  class Config
    attr_accessor :path, :debug
    attr_reader :path, :debug, :rows, :columns, :width, :height, :suffixes

    def initialize(path = '', debug = false)
      @path = path
      @debug = debug
      @rows = 5
      @columns = 4
      @width = 15
      @height = 37
      @suffixes = [
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
    end
  end
end
