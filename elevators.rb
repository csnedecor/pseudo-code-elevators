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
puts "How many floors are waiting for elevators?"
# For an actual elevator program, this information would be calculated as people
# push the up or down buttons on each floor, but as we only have one command
# line, not 25, we'll have to settle for getting this information up front.
elevator_requests = gets.chomp.to_i
counter = 1
floor_requests = []


while counter <= elevator_requests
  # Go through the following actions for every floor that has called an elevator.
  puts "What floor is person #{counter} on? (Enter a floor number from 1-25)"
  floor = gets.chomp.to_i
  puts "Does this person want to go up or down? (Enter 'up' or 'down')"
  direction = gets.chomp.downcase
  binding.pry
  floor_requests << {floor: floor, direction: direction}
  counter += 1
end

  # floor_requests.each do |floor_request|
  #   elevators.each do |elevator|
  #     if elevator.state == "standing" && elevator.current_floor == floor_request
  #       puts "Elevator #{ elevators.index(elevator) + 1 } has arrived.
  #       What floor do you want to go to?"
  #         destination = gets.chomp
  #         floor_requests - [floor_request]
  #         if new_floor > floor
  #           elevator.state = "up"
  #         elsif new_floor < floor
  #           elevator.state = "down"
  #         else
  #           elevator.state = "standing"
  #         end
  #         while elevator.current_floor < destination
  #
  #         end
  #       end
  #
  #       elevators.each do |elevator|
  #         if elevator.state == "standing" && elevator.current_floor == floor
  #           puts "Elevator #{ elevators.index(elevator) + 1 } has arrived.
  #           What floor do you want to go to?"
  #             floor_requests - [floor]
  #             new_floor = gets.chomp
  #             elevator.current_floor = floor
  #             if new_floor > floor
  #               elevator.state = "up"
  #
  #
  #
  #               counter += 1
  #             end
  #
  #             # Gaps in logic: This program only checks the elevator's current floor when
  #             # the elevator is standing.  In real life, you'd want it to
  #             # increment or decrement as it approaches its destination, and the program would
  #             # constantly check its floor number
  #             # Get floor requests from people using the elevator (in real life this would be
  #             # done through the pushing of buttons, but for the sake of this example program,
  #             # we'll take in floor numbers through the command line)
  #
  #             floor_requests.each do |floor request|
  #               elevators.each do |elevator|
  #                 if elevator.state == stand && elevator.floor == request_floor
  #                   open elevator door
  #                   remove floor from floor_requests
  #                 elsif elevator.state == down && elevator.current_floor > request_floor
  #                   go to floor
  #                   open elevator door
  #                   remove floor from floor_requests
  #                 elsif elevator.state == up && elevator.current_floor < request_floor
  #                   go to floor
  #                   open elevator door
  #                   remove floor from floor_requests
  #                 elsif elevator.state == stand
  #                   go to floor
  #                   open elevator door
  #                   remove floor from floor_requests
  #                 end
  #               end
  #             end
  #
  #             class ElevatorGroup
  #               has many elevators
  #               elevators.each do |elevator|
  #                 if elevator.direction == stand && elevator.floor == request_floor
  #                 end
