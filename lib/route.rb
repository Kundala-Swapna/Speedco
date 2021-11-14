# string_frozen_literal: true

class Route

  @@stop_list = Array.new

  attr_reader :route_name

  def initialize(route_name)
    @route_name = route_name
  end

  def is_added
    !route_name.nil?
  end

  def add_stops(stop_list)
    stop_list.each do |stop|
      get_stop_list << stop
    end
  end

  def remove_stop(code)
    get_stop_list.each do |stop|
      if stop.code.eql?(code)
        get_stop_list.delete(stop)
      end
    end
  end

  def get_stop_list_as_string
    code_list = StringIO.new

    get_stop_list.each_with_index do |stop, index|
      code_list.puts "," if index != 0
      code_list.puts stop.code
    end
    code_list.string
  end

  def get_name
    route_name
  end

  def get_stop_list
    @@stop_list
  end

end
