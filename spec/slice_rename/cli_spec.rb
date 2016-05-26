require 'slice_rename/cli'

RSpec.describe SliceRename::Cli do
  describe '.perform' do
    it 'passes the config over to slice_image' do
      expect(SliceRename::Slicer).to receive(:slice_image)
      SliceRename::Cli.perform
    end
  end
end
