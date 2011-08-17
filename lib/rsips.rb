# Load dependencies
require 'fileutils'

# Add lib/rsips to load path
$:.unshift File.expand_path(File.dirname(__FILE__))

# rsips
module Rsips
  
  # Current version of rsips
  VERSION = '0.1.0'
  
end

require 'rsips/sips'
require 'rsips/image'
require 'rsips/batch'