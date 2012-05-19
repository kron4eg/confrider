# -*- encoding: utf-8 -*-

require 'rubygems' if RUBY_VERSION < '1.9'
require 'bundler/setup'
require 'bundler/gem_tasks'

desc 'Default run rake spec'
task :default => :spec

desc 'Run all tests'
task :spec do
  system('bundle exec rspec spec')
end
