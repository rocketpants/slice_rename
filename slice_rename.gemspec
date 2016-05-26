$LOAD_PATH << File.expand_path("../lib", __FILE__)
require 'slice_rename'

Gem::Specification.new do |s|
  s.name = 'slice_rename'
  s.version = SliceRename::VERSION
  s.executables << 'slice_rename'

  s.authors = ['Zoee Silcock']
  s.email = %q{mrzoee@gmail.com}
  s.homepage = %q{https://github.com/rocketpants/slice_rename}
  s.description = %q{Slice an image and give each slice a specific name.}
  s.summary = %q{Slice an image and give each slice a specific name.}
  s.licenses = ['MIT']

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ['lib']
end
