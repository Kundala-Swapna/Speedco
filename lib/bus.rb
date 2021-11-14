# string_frozen_literal: true
require 'date'

class Bus
  attr_reader :registration_number, :time, :lines

  def initialize(registration_number)
    @registration_number = registration_number
    @lines = []
  end

  def is_registered
    !registration_number.nil?
  end

  def add_line(line)
    lines.push(line)
  end

  def remove_line(route_name)
    lines.each_with_index do  |line, index|
      if line.get_forward_route_name.eql?(route_name)
        lines.delete_at(index)
      end
    end
  end

  def add_route_with_line(route_name)
    line = Line.new(route_name)
    add_line(line)
  end

  def set_time(datetime)
    @time = datetime.strftime("%H:%M %p")
  end

end
