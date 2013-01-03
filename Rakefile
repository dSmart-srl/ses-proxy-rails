# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "ses-proxy-rails"
  gem.homepage = "http://github.com/maintux/ses-proxy-rails"
  gem.license = "MIT"
  gem.summary = "Add support to send a custom header when you use ActionMailer and ses-proxy gem."
  gem.description = "This gem allow you to send an header that contain the application name to ses-proxy. So you can see, in the SES Proxy WebPanel, the system from which you sent your emails"
  gem.email = "maintux@gmail.com"
  gem.authors = ["Massimo Maino"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new