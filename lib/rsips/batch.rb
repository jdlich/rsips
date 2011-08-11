module Rsips::Batch
  
  def self.resize(images, long_edge)
    images.each { |img| self.new(img).resize! long_edge }
  end
end
  