require 'bundler'
require 'rake/testtask'
require_relative 'lib/snoother'
Bundler::GemHelper.install_tasks

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/test_*.rb']
  t.verbose = true
end

# desc "Load stuff in IRB."
# task :console do
#   exec "irb -Ilib -rsmpl"
# end

task :default => :test
