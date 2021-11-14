# string_frozen_literal: true

class BusSchedule

  attr_reader :bus_schedule_map

  def initialize
    @bus_schedule_map = Hash.new
  end

  def add_bus_to_schedule(registration_name, bus)
    bus_schedule_map["#{registration_name}"] = bus
  end

  def remove_bus(registration)
    bus_schedule_map.delete(registration)
  end

  def update_bus(registration_name, new_bus)
    bus = bus_schedule_map["#{registration_name}"]
    bus["#{registration_name}"] = new_bus
  end

  def get_bus_schedule
    bus_schedule_map
  end
end
