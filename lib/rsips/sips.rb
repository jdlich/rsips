module Rsips::Sips
  
  def properties
    Hash[`sips -g all '#{@img}'`.split("\n")[1..-1].map { |i| i.strip.split(": ") }]
  end
  
  def reset(*properties)
    properties.each do |p|
      name = case p
        when :height then "pixelHeight"
        when :width  then "pixelWidth"
        else name.camel_case
      end
      value = `sips -g #{p} '#{@img}'`.chomp.match(/:\s(.+)\z/) { $1 }
      instance_variable_set("@#{p}", value)
    end
  end
  
  def resample(dimension, pixels, &block)
    sips "--resample#{dimension.capitalize} #{pixels} '#{@img}'"
    block_given? ? yield : @img
  end
  
  def reformat(type, options={})
    options = options[:compression] || "default"
    new_ext = case type
      when :jpeg then "jpg"
      when :tiff then "tif"
      else type
    end
    new_image = replace_ext(@img, new_ext)
    
    sips "-s format #{type} -s formatOptions #{options} '#{@img}' --out #{new_image}"
    new_image
  end
  
  private
  
  def sips(command)
    system "sips #{command}"
  end
  
  def replace_ext(filename, new_ext)
    filename.split('.')[0..-2].push(new_ext).join('.')
  end
end