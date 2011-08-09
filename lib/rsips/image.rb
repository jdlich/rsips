require 'rsips/sips'

module Rsips
  
  class Image
  
    include Rsips::Sips

    attr_reader :width, :height

    def initialize(img)
      @img    = img
      @width  = get_dimension :width
      @height = get_dimension :height
    end

    def resize!(long_edge)
      vertical? ? resample(:height, long_edge) : resample(:width, long_edge)
      self
    end

    def vertical?
      @height > @width
    end
  end
end