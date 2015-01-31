#!/usr/bin/env ruby
require "pry"
require_relative "computer"
require_relative "elevator"

# If you have 6 elevators in a 25 story building, how would you go about
# programming them?

# Thinking in terms of the metaphor we talked about yesterday, where we have
# the elevator's computer and the elevator, we’d want to make a class for each:

# Create 6 elevators, each on a random floor (somewhere between the
# first and 25th floor, inclusively) and each moving up or down, or standing.
elevators = []
states = ["up", "down", "standing"]
6.times do
  elevators << Elevator.new(states.sample, rand(1..25))
end

Computer.get_floor_requests.each do |floor_request|
  elevators.each do |elevator|
    # For each floor request, check if there is an elevator on that floor,
    # standing, or going in the same direction the person wishes to go.
    if (elevator.state == "standing" ||
      elevator.state == floor_request[:direction]) &&
      elevator.current_floor == floor_request[:floor]

      # Output which elevator has come to pick that person up, and get the floor
      # number they wish to go to.
      puts "Elevator #{elevators.index(elevator) + 1} has arrived for floor
      #{floor_request[:floor]}'s request to go #{floor_request[:direction]}.
      What floor do you want to go to?"
      destination = gets.chomp
      # Remove the request from the floor_requests array, as it has now been
      # dealt with.
      floor_requests - [floor_request]

      # Call the go_up, go_down, or stand methods from the elevator class based
      # on the new destination.
      if destination > elevator.current_floor
        elevator.go_up
      elsif destination < elevator.current_floor
        elevator.go_down
      else
        elevator.stand
      end
    # If the elevator is heading down and the floor_request direction is down,
    # call the go_down method to check each floor as the elevator goes down.
    elsif elevator.state == "down" &&
      elevator.current_floor < floor_request[:floor]
      elevator.go_down
    # If the elevator is heading up and the floor_request direction is up,
    # call the go_up method to check each floor as the elevator goes up.
    elsif elevator.state == "up" &&
      elevator.current_floor > floor_request[:floor]
      elevator.go_up
    # if the elevator is standing on a floor above the request_floor, call the
    # go down method.
    elsif elevator.state == "standing" &&
      elevator.current_floor > floor_request[:floor]
      elevator.go_down
    # if the elevator is standing and is on a floor below the request_floor,
    # call the go_up method.
    elsif elevator.state == "standing" &&
      elevator.current_floor < floor_request[:floor]
      elevator.go_up
    end
  end
end
