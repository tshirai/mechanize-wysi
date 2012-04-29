SimpleCov.start do
  add_filter "/bundle/"
end
require 'simplecov-rcov'
SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
