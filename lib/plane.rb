class Plane

  def initialize
    @plane_status = "in_flight"
  end

  def take_off
    raise "Cannot take off: plane is already in flight" if in_flight
  end

  def land(airport)
    raise "Cannot land plane: plane is already in the airport" if landed
    @plane_status = "in_airport"
    @airport = airport
  end

  def airport
    raise "Is not in airport: as it is already flying" if in_flight
    @airport
  end


  private

  attr_reader :plane_status

  def landed
    plane_status == "in_airport"
  end

  def in_flight
    plane_status == "in_flight"
  end

end
