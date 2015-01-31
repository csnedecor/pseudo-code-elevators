class Elevator
  MAX_FLOOR = 25
  MIN_FLOOR = 1
  attr_accessor :state, :current_floor
  def initialize(state, current_floor)
    # where state is either "up", "down", or "standing"
    # and current_floor is an integer between 1 and 25
    @state = state
    @current_floor = current_floor
  end

  def go_up
    self.state = "up"
    while current_floor < MAX_FLOOR
      # increment the current_floor
      # As it reaches each floor, check to see if there has been a request for "up"
      # on that floor, or if it is the destination floor
      # If there has been a request for up or it is the destination floor,
      # open the doors, close them, remove the floor from the list of
      # floor requests, and continue up.
    end
  end

  def go_down
    self.state = "down"
    while current_floor > MIN_FLOOR
    #   decrement the current_floor
    #   As it reaches each floor, check to see if there has been a request
    #   for "down" on that floor, or if it is the destination floor
    #
    #   If there has been a request for "down" or it is the destination floor,
    #   open the doors, close them, remove the floor from the list of
    #   floor requests, and continue down.
    end
  end

  def stand
    state = "standing"
  end
end
