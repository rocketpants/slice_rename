require 'slice_rename/combiner'

RSpec.describe SliceRename::Combiner do
  let(:config) { SliceRename::Config.new }
  let(:suffixes) {
    [
      'apples',
      'oranges',
      'pears',
      'bananas'
    ]
  }

  before do
    config.instance_variable_set :@path, 'fruits.png'
    config.instance_variable_set :@rows, 2
    config.instance_variable_set :@columns, 2
    config.instance_variable_set :@suffixes, suffixes
  end

  describe '.combine_images' do
    it 'combines the images and saves them as a single image' do
      expect(SliceRename::Combiner).to(
        receive(:save_combination).exactly(1).times do |input_names, output_name, geometry, tile, border|
          input_names.each_with_index do |name, index|
            expect(name).to include suffixes[index]
          end

          expect(output_name).to include config.path
        end
      )

      SliceRename::Combiner.combine_images config
    end
  end
end
