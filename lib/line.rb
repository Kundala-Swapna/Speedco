# string_frozen_literal: true

class Line

  attr_reader :route_list, :route_name

  def initialize(forward_route: nil)
    @route_list = Array.new
    add_route(forward_route)
  end

  def add_route(forward_route)
    @route_list << forward_route
  end

  def get_forward_route_name
    route_list[0].get_name
  end

  def get_stop_list
    return nil if route_list.empty?

    stops_for_route = StringIO.new
    route_list.each do |route|
      stops_for_route.puts route.get_stop_list_as_string
    end
    stops_for_route.string
  end

  def remove_stop_from_list(code)
    return nil if route_list.empty?
    route_list.each do |route|
      route.remove_stop(code)
      return route
    end
  rescue
    nil
  end

end
