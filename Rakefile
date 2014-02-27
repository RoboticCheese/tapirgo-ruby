# Encoding: UTF-8

require 'bundler/setup'
require 'bundler/gem_tasks'
require 'rubocop/rake_task'
require 'cane/rake_task'
require 'rspec/core/rake_task'

Cane::RakeTask.new

Rubocop::RakeTask.new do |task|
  task.patterns = %w{**/*.rb}
end

desc 'Display LOC stats'
task :loc do
  puts "\n## LOC Stats"
  sh 'countloc -r lib'
end

RSpec::Core::RakeTask.new(:spec)

task :default => [ :cane, :rubocop, :loc, :spec ]

# vim: ai et ts=2 sts=2 sw=2 ft=ruby
