class Vehicle

	VERSION = 42.0
	
	@@vehicle_number = 0

	def initialize (wheels_number, speed)
		@wheels_number = wheels_number
		@speed = speed
		@position = 0
		@direction = 1
		@@vehicle_number += 1
	end

	def describe 
		puts "\nThis vehicle has #{@wheels_number} wheels"
		write_position
		self.class.display_vehicle_count
	end

	def self.display_vehicle_count
		puts "There are now #{@@vehicle_number} vehicle(s) in memory"
	end

	def move_forward
		@position= @position + @speed + @direction
		write_position		
	end

	private

	def write_position
		puts "Position: #{@position} from origin"
		sleep 0.5
	end

end

class Car < Vehicle

	def initialize (speed)
		@wheels_number = 4
		@speed = speed	
		@position = 0
		@direction = 1	
	end
end

class Motocycle < Vehicle

	def initialize (speed)
		super 2, speed
	end
end

class Train < Vehicle

	def initialize
		super 16, 2000
		@direction = 1
	end

	def set_direction(new_direction)
		puts "This vehicle cannot change direction"
	end

	def move_forward
		@position = @position + @speed
		write_position 
	end

end

#without private method
my_car = Car.new(150)
my_car.describe
my_car.move_forward


my_moto = Motocycle.new(99)
my_moto.describe
my_moto.move_forward

my_train = Train.new
my_train.describe
my_train.move_forward

#with private method
my_car.write_position
