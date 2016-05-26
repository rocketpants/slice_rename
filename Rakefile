task default: %w[run]

task :run do
  ruby '-I ./lib bin/slice_rename spec/fixtures/char2.png -c spec/fixtures/config_example.yml'
end

namespace :run do
  task :debug do
    ruby '-I ./lib bin/slice_rename --debug spec/fixtures/char2.png -c spec/fixtures/config_example.yml'
  end

  task :version do
    ruby '-I ./lib bin/slice_rename --version'
  end

  task :help do
    ruby '-I ./lib bin/slice_rename --help'
  end

  task :invalid do
    ruby '-I ./lib bin/slice_rename --poop'
  end

  task :missing do
    ruby '-I ./lib bin/slice_rename'
  end
end
