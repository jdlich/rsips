module Rsips
  class Image

    attr_reader :width, :height

    def initialize img
      @img    = img
      @width  = get_dimension :width
      @height = get_dimension :height
    end

    def resize(long_side)
      if vertical?
        resample :height, long_side
      else
        resample :width, long_side
      end
    end

    def vertical?
      @height > @width
    end

    private

    def resample(dimension, pixels)
      system "sips --resample#{dimension.capitalize} #{pixels} #{@img}"
    end

    def get_dimension(dimension)
      `sips --getProperty pixel#{dimension.capitalize} #{@img}`.chomp.slice(/\d+$/)
    end
  end
end