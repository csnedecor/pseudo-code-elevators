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
6.times do
  elevators << Elevator.new(@states.sample, rand(1..25))
end
