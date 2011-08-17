module Rsips::Sips
  
  def properties
    Hash[`sips -g all '#{@img}'`.split("\n")[1..-1].map { |i| i.strip.split(": ") }]
  end
  
  def resample(dimension, pixels)
    sips "--resample#{dimension.capitalize} #{pixels} '#{@img}'"
  end
  
  def format(type, options={})
    options = options[:compression] || "default"
    new_ext = case type
      when :jpeg then "jpg"
      when :tiff then "tif"
      else type
    end
    new_image = replace_ext(@img, new_ext)
    sips "-s format #{type} -s formatOptions #{options} '#{@img}' --out #{new_image}"
  end
  
  private
  
  def sips(command)
    system "sips #{command}"
  end
  
  def replace_ext(filename, new_ext)
    filename.split('.')[0..-2].push(new_ext).join('.')
  end
end