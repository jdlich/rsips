# Load dependencies
require 'fileutils'

# Add lib/rsips to load path
$:.unshift File.expand_path(File.dirname(__FILE__))

# rsips
require 'rsips/sips'
require 'rsips/image'
require 'rsips/collection'

module Rsips
  
  # Current version of rsips
  VERSION = '0.0.1'
  
end