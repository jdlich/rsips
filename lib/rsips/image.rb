module Rsips
  
  class Image
  
    include Rsips::Sips
        
    def initialize(img)
      @img = img
      
      properties.each do |k, v|
        instance_variable_set("@#{k}", v)
        instance_eval %{
          def #{k}
            instance_variable_get("@#{k}")
          end
        }
      end
    end

    def resize!(long_edge)
      vertical? ? resample(:height, long_edge) : resample(:width, long_edge)
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