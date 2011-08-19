module Rsips
  
  class Image
  
    include Rsips::Sips
        
    def initialize(img)
      @img = img
      
      # sips properties
      properties.each do |k, v|
        instance_variable_set("@#{k}", v)
        instance_eval %{
          def #{k}
            instance_variable_get("@#{k}")
          end
        }
      end
    end

    def resize!(pixels)
      long_edge = vertical? ? :height : :width
      resample(long_edge, pixels) do
        @pixelHeight = get_property :pixelHeight
        @pixelWidth  = get_property :pixelWidth
      end
    end
        
    def to_jpg!(compression="default")
      dup.to_jpg
      FileUtils.rm @img
    end
    
    def to_jpg(compression="default")
      format :jpeg, :compression => compression
    end
    
    def orientation
      vertical? ? 'vertical' : 'horizontal'
    end

    def vertical?
      @pixelHeight.to_i > @pixelWidth.to_i # temporarily coerce here
    end
  end
end