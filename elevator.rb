class Elevator
  attr_accessor :state
  def initialize(state, current_floor)
    # where state is either "up", "down", or "standing"
    # and current_floor is an integer between 1 and 25
    @state = state
    @current_floor = current_floor
  end
end
