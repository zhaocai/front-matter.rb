$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])

require "rspec"

require 'facets/string'
require "front_matter"

RSpec.configure do |c|
  c.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  c.tty = true

  c.formatter = :documentation # :progress, :html, :textmate

  c.mock_with :rspec
end

