require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../spec/support')
require 'mechanize-wysi'
require 'test_object'

require 'rspec/expectations'

class Mechanize::TestAgent < Mechanize
  include Mechanize::Wysi
end

