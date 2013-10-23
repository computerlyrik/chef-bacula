#!/usr/bin/env rake

FoodCritic::Rake::LintTask.new do |t|
    t.options = { :fail_tags => ['any'] }
end

begin
  require 'kitchen/rake_tasks'
  Kitchen::RakeTasks.new
rescue LoadError
  puts "* Kitchen gem not loaded, omitting tasks"
end

# vim: ai et ts=2 sts=2 sw=2 ft=ruby fdm=marker
