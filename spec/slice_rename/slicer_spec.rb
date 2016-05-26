require 'slice_rename/slicer'

RSpec.describe SliceRename::Slicer do
  let(:image_double) { double(:image) }
  let(:config) { SliceRename::Config.new }
  let(:suffixes) {
    [
      'potatoes',
      'carrots',
      'onions',
      'selery'
    ]
  }

  before do
    config.instance_variable_set :@rows, 2
    config.instance_variable_set :@columns, 2
    config.instance_variable_set :@suffixes, suffixes
    allow(SliceRename::Slicer).to receive(:open_image) { image_double }
  end

  describe '.slice_image' do
    it 'saves the slices with the correct suffixes' do
      call_count = 0
      expect(SliceRename::Slicer).to(
        receive(:save_slice).exactly(4).times do |image, name, cropping|
          expect(image).to eq(image)
          expect(name).to include suffixes[call_count]
          # Should probably test the cropping logic somehow also.

          call_count += 1
        end
      )

      SliceRename::Slicer.slice_image 'somewhere/my_awesome_image.png', config
    end
  end
end
