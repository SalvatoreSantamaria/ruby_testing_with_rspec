class Car
  
  attr_accessor :make, :year, :color, :windows
  attr_reader :wheels
  attr_writer :doors
  
  def initialize(options={})
    self.make = options[:make] || 'Volvo'
    self.year = (options[:year] || 2007).to_i
    self.color = options[:color] || 'unknown'
    self.windows = options[:windows] || 'unknown' 
    @wheels = 4
  end
  
  def self.colors
    ['blue', 'black', 'red', 'green']
  end

  def self.windows
    ['manual', 'electric', 'tinted']
  end
  
  def full_name
    "#{self.year.to_s} #{self.make} (#{self.color})"
  end
  
end
