class Elevator
  def initialize(state, current_floor)
    # where state is either "up", "down", or "standing"
    # and current_floor is an integer between 1 and 25
    @states = ["up", "down", "standing"]
    @current_floor = current_floor
  end
end
