require_relative 'weather'

class Airport

  attr_reader :planes, :weather

  DEFAULT_CAPACITY = 10

    def initialize(capacity = DEFAULT_CAPACITY)
      @planes = []
      @capacity = capacity
    end

    def land_plane(plane)
      raise "Cannot land plane: weather is stormy" if is_stormy?
      raise "Cannot land plane: airport if full" if full_capacity?
      @planes.push(plane)
    end

    def take_off(plane)
      raise "Cannot take off: the wheather is stormy" if is_stormy?
      @planes.delete(plane)
    end

  private

    def is_stormy?
      Weather.new.condition == "stormy"
    end

    def full_capacity?
      @planes.length >= @capacity
    end

end
