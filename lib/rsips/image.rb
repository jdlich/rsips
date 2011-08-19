module Rsips
  
  class Image
  
    include Rsips::Sips
        
    def initialize(img)
      @img = img
      
      properties.each do |name, value|
        name = case name
          when "pixelHeight" then :height
          when "pixelWidth"  then :width
          else name.underscore
        end
        instance_variable_set("@#{name}", value)
        instance_eval %{
          def #{name}
            instance_variable_get("@#{name}")
          end
        }
      end
    end

    def resize!(pixels)
      long_edge = vertical? ? :height : :width
      resample(long_edge, pixels) do
        @height = get_property :height
        @width  = get_property :width
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
      @height.to_i > @width.to_i # temporarily coerce here
    end
  end
end