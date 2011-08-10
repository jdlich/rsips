module Rsips
  
  class Image
  
    include Rsips::Sips

    attr_reader :width, :height
    
    def initialize(img)
      @img    = img
      @width  = get_dimension :width
      @height = get_dimension :height
    end

    # TODO: how do you know it's long edge?
    # pass in both long and short edges with
    # short edge being optional
    def resize!(long_edge)
      vertical? ? resample(:height, long_edge) : resample(:width, long_edge)
      self
    end
        
    def to_jpg!(compression="default")
      dup.to_jpg
      FileUtils.rm @img
    end
    
    def to_jpg(compression="default")
      format :jpeg, :compression => compression
    end

    def vertical?
      @height > @width
    end
  end
end