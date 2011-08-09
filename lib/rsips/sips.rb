module Rsips::Sips
  def resample(dimension, pixels)
    sips "--resample#{dimension.capitalize} #{pixels} #{@img}"
  end

  def get_dimension(dimension)
    `sips --getProperty pixel#{dimension.capitalize} #{@img}`.chomp.slice(/\d+$/)
  end
  
  private
  
  def sips(command)
    system "sips #{command}"
  end
end