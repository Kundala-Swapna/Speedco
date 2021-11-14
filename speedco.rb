# string_frozen_literal: true 

require 'stringio'

require_relative 'lib/bus'
require_relative 'lib/bus_schedule'
require_relative 'lib/line'
require_relative 'lib/route'
require_relative 'lib/stop'
require_relative 'lib/options'

class SpeedCo

  attr_reader :option, :schedule

  def initialize
  end

  def run
    Options.new.choose_option
  rescue StandardError => e
    puts "Error: #{e.inspect}"
    puts "\t\n Something Went Wrong. Please try again.!"
  end

end

speed_co = SpeedCo.new
speed_co.run
