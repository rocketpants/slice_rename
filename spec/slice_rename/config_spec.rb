require 'yaml'
require 'slice_rename/config'

RSpec.describe SliceRename::Config do
  let(:config) { SliceRename::Config.new }

  describe '#load' do
    let(:config_path) { 'path/to/my_awesome_config.yml' }

    it 'loads the config file' do
      expect(YAML).to receive(:load_file) { {} }
      config.load config_path
    end
  end

  describe '#suffixes' do
    let!(:suffixes) { ['poop'] }

    it 'returns the supplied suffixes if it has enough' do
      config.instance_variable_set :@suffixes, suffixes
      expect(config.suffixes).to eq suffixes
    end

    it 'returns an auto generated array if suffixes are missing' do
      config.instance_variable_set :@rows, 2
      config.instance_variable_set :@columns, 2
      expect(config.suffixes).to eq ['_01', '_02', '_03', '_04']
    end
  end

  describe 'fields' do
    it 'exposes the input file path' do
      expect(config.path).to be_a String
    end

    it 'exposes whether to display debug info' do
      expect(config.debug).to eq false
    end

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

    it 'exposes the padding between slices' do
      expect(config.padding).to be_an Integer
    end

    it 'exposes a list of suffixes for the resulting file names' do
      expect(config.suffixes).to be_an Array
    end
  end
end
