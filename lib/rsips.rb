# Load dependencies
require 'fileutils'

# Add lib/rsips to load path
$:.unshift File.expand_path(File.dirname(__FILE__))

# Create Rsips module for namespacing
module Rsips
end

# Load rsips
require 'rsips/sips'
require 'rsips/image'
require 'rsips/collection'
