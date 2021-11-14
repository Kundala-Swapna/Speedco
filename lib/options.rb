# string_frozen_literal: true

require_relative 'menu'

class Options

  attr_reader :schedule, :option

  def initialize
    @schedule = BusSchedule.new
    @option = 1
  end

  def choose_option
    while true
      Menu.display
      option = gets.chomp.to_i
      @option = option
      case @option
        when 0
          puts("Create a sample bus with scheduling : ")
          create_sample_bus_schedule
        when 1
          print("You choose to add a bus. Please provide bus registration name : ")
          input = gets.chomp
          register_bus(input)
          puts("Bus with registration name : "+input+" is registered")
        when 2
          print("You choose to remove a bus. Please provide bus registration name : ")
          input_bus = gets.chomp
          unregister_bus(input_bus)
          puts("Bus with registration name: #{input_bus}  is removed.")
        when 3
          print("You choose to add a stop. Please provide stop code : ")
          stop_code = gets.chomp
          puts("Stop with code: #{stop_code} is added ")
          add_stop(stop_code)
        when 4
          print("You choose to remove a stop. Please provide stop code : ")
          remove_stop_code = gets.chomp
          puts("Stop with code: #{remove_stop_code} is removed.")
          remove_stop(remove_stop_code)
        when 5
          print("You choose to add a route. Please provide route name that needs to be added : ")
          add_route = gets.chomp
          puts("Route with name: #{add_route} is added.")
          add_route(add_route)
        when 6
          print("You choose to remove a route. Please provide route name that needs to be removed : ")
          remove_route = gets.chomp
          puts("Route with name: #{remove_route} is removed.")
          remove_route(remove_route)
        when 7
          print("You choose to add a line. Please provide route name that needs to be added to a line : ")
          add_line_route_name = gets.chomp
          puts("Line with route name: #{add_line_route_name} is added.")
          add_line_using_route_name(add_line_route_name)
        when 8
          print("You choose to remove a line. Please provide route name that needs to be removed to a line : ")
          remove_line_route_name = gets.chomp
          print("Please provide bus registration name for which line needs to be removed : ")
          bus_name = gets.chomp
          puts("Line with route name: #{remove_line_route_name} is removed.")
          remove_line(bus_name, remove_line_route_name)
        when 9
          puts("You choose to exit.")
          exit
        else
          puts "Invalid Option"
          exit
      end
    end
  end

  def print_schedule(registration_name)
    map =  schedule.bus_schedule_map
    bus1 = map[registration_name]
    if bus1 == nil
      puts("There is no schedule for the bus :"+ registration_name)
    else
      print("Bus : "+ bus1.registration_number + " Starts at time : "+ bus1.time)
      lines = bus1.lines
      print(" Routes associated with this bus are :")
      lines.each do |line|
        print(line.get_forward_route_name)
        print(" has stops : "+ line.get_stop_list)
      end
    end
    puts("\n")
  end

  def create_sample_bus_schedule
    stop1 = "A1"
    stop2 = "B3"
    stop3 = "Q4"
    route1 = "M44"

    bus1_registration_name = "ABC-123"
    bus1 = Bus.new(bus1_registration_name)

    # // create a route with multiple stops
    stop_list = []
    stop_list << add_stop(stop1)
    stop_list << add_stop(stop2)
    stop_list << add_stop(stop3)

    forward_route = add_route(route1)
    forward_route.add_stops(stop_list)

    #create a Line
    line = add_line(forward_route)

    # add Routes to line
    bus1.add_line(line)
    bus1.set_time(DateTime.now)
    schedule.add_bus_to_schedule(bus1_registration_name, bus1)
    print_schedule(bus1_registration_name)
  end

  def add_line(route)
    line = Line.new(forward_route: route)
    if line.get_forward_route_name.eql?(route.get_name)
      print("Route #{route.get_name} successfully added to Line. \n");
    end
    line
  end

  def add_line_using_route_name(route_name)
    line = Line.new(forward_route: route_name)
    print("Route #{route_name} successfully added to Line. \n") if line.get_forward_route_name.eql?(route_name)
    line
  end

  def remove_line(bus_name, route_name)
    b1 = schedule.bus_schedule_map[bus_name.to_sym]
    if b1 != nil
      b1.remove_line(route_name)
      schedule.update_bus(bus_name, b1)
    else
      print("There is no bus with this bus name : "+ bus_name);
    end

  end

  def unregister_bus(registration)
    schedule.remove_bus(registration)
  end

  def register_bus(bus_registration)
    bus = Bus.new(bus_registration)
    print("Bus #{bus_registration} is successfully registered\n") if bus.is_registered
    bus
  end

  def add_stop(code)
    stop = Stop.new(code)
    print("Stop #{code} is successfully added\n") if stop.is_added
    stop
  end

  def remove_stop(code)
    line = Line.new
    line.remove_stop_from_list(code)
    schedule.bus_schedule_map
  end

  def add_route(route_name)
    route = Route.new(route_name)
    print("Route #{route_name} is successfully added\n") if route.is_added
    route
  end

  def remove_route(route_name)
    line = Line.new(forward_route: route_name)
    line.remove_stop_from_list(route_name)
  end

end
