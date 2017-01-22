class Airport

  attr_reader :planes

  DEFAULT_CAPACITY = 10

    def initialize(capacity = DEFAULT_CAPACITY)
      @planes = []
      @capacity = capacity
    end

    def land_plane(plane)
      @planes.push(plane) unless full_capacity?
    end

    def take_off(plane)
      @planes.delete(plane)
    end

  private

    def full_capacity?
      @planes.length >= @capacity
    end

end
