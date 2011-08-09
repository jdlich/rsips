module Rsips::Sips
  def resample(dimension, pixels)
    sips "--resample#{dimension.capitalize} #{pixels} #{@img}"
  end

  def get_dimension(dimension)
    `sips -g pixel#{dimension.capitalize} #{@img}`.chomp.slice(/\d+$/)
  end
  
  def format(type, options={})
    options  = options[:compression] || "default"
    file_ext = case type
      when :jpeg then "jpg"
      when :tiff then "tif"
      else type
    end
    new_image = "#{@img.split('.')[0..-2].join('.')}.#{file_ext}"
    sips "-s format #{type} -s formatOptions #{options} #{@img} --out #{new_image}"
  end
  
  private
  
  def sips(command)
    system "sips #{command}"
  end
end