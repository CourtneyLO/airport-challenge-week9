require_relative 'weather'

class Airport

  attr_reader :planes, :weather

  DEFAULT_CAPACITY = 10

    def initialize(capacity = DEFAULT_CAPACITY)
      @planes = []
      @capacity = capacity
    end

    def land_plane(plane)
      @planes.push(plane) unless full_capacity? || is_stormy?
    end

    def take_off(plane)
      @planes.delete(plane) unless is_stormy?
    end

  private

    def is_stormy?
      Weather.new.condition == "stormy"
    end

    def full_capacity?
      @planes.length >= @capacity
    end

end
