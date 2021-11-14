# string_frozen_literal: true

class Stop
  attr_reader :code

  def initialize(code)
    @code = code
  end

  def is_added
    !code.nil?
  end
end
