require 'rubygems'
require 'rake/gempackagetask'
require 'rake/testtask'


desc 'Running all unit tests'
task :default => :test

Rake::TestTask.new(:test) do |t|
  t.test_files = FileList['test/**/*test.rb', 'test/*test.rb']
end
