class Computer
# Knows where requests are, knows where elevators are,
# can send commands to elevators
  def self.count_requests
    puts "How many floors are waiting for elevators?"
    # For an actual elevator program, this information would be calculated as people
    # push the up or down buttons on each floor, but as we only have one command
    # line, not 25, we'll have to settle for getting this information up front.
    @elevator_requests = gets.chomp.to_i
    while !@elevator_requests.between?(1, 25)
      puts "There are 25 stories in this building. Please enter an integer from 1 to 25."
      @elevator_requests = gets.chomp.to_i
    end
    @elevator_requests
  end

  def self.get_floor_requests
    self.count_requests
    counter = 1
    floor_requests = []

    while counter <= @elevator_requests
      # Go through the following actions for every floor that is calling an elevator:
      # 1. Get the floor the person is already on.
      puts "What floor is person #{counter} on? (Enter a floor number from 1-25)"
      floor = gets.chomp.to_i
      while !floor.between?(1, 25)
        puts "There are 25 stories in this building. Please enter an integer from 1 to 25."
        floor = gets.chomp.to_i
      end
      # 2. Find out if they want to go up or down
      puts "Does this person want to go up or down? (Enter 'up' or 'down')"
      direction = gets.chomp.downcase
      while direction != "down" && direction != "up"
        puts "Please enter either 'up' or 'down.'"
        direction = gets.chomp.downcase
      end
      # 3. Put those values into a hash, and push it into the floor_requests array
      # to be used later
      floor_requests << {floor: floor, direction: direction}
      counter += 1
    end
    floor_requests
  end
end
