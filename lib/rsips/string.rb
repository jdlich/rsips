class String  
  def underscore
    self.gsub(/([A-Z])/) { "_" + $1.downcase }
  end
  
  def camel_case
    self.gsub(/(_|\s)(\w)/) { $2.capitalize }
  end
end