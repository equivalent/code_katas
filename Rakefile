require 'rake/testtask'
require 'rspec/core/rake_task'

Rake::TestTask.new(:test) do |t|
  t.test_files = Dir['**/*_test.rb'].reject do |path|
    path.include?('vendor')  # tell travis CI to ignore vendor tests
  end
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = Dir.glob('**/*_spec.rb')
  t.exclude_pattern = 'vendor'
  # t.rspec_opts = '--format documentation'
end

task default: [:test, :spec]
