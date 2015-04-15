require 'rake/testtask'
require 'rspec/core/rake_task'

Rake::TestTask.new(:test) do |t|
  t.pattern = './**/*_test.rb'
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = Dir.glob('./**/*_spec.rb')
  # t.rspec_opts = '--format documentation'
end

task default: [:test, :spec]
