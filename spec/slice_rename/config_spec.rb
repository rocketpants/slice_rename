require 'slice_rename/config'

RSpec.describe SliceRename::Config do
  let(:config) { SliceRename::Config.new }

  describe 'fields' do
    it 'exposes the number of rows' do
      expect(config.rows).to be_an Integer
    end

    it 'exposes the number of columns' do
      expect(config.columns).to be_an Integer
    end

    it 'exposes the width of each slice' do
      expect(config.width).to be_an Integer
    end

    it 'exposes the height of each slice' do
      expect(config.height).to be_an Integer
    end

    it 'exposes a list of suffixes for the resulting file names' do
      expect(config.suffixes).to be_an Array
    end
  end
end
