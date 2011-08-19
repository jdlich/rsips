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
        value = case value
          when /^\d+$/ then value.to_i
          else value
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
        reset :height, :width
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
      @height > @width
    end
  end
end