module Rsips
  class Image

    attr_reader :width, :height

    def initialize img
      @img    = img
      @width  = get_dimension :width
      @height = get_dimension :height
    end

    def resize(long_edge)
      vertical? ? resample(:height, long_edge) : resample(:width, long_edge)
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