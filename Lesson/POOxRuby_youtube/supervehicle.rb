class Vehicle

	def describe
		puts "\nThis vehicle is a #{self.class}"
		puts "Its superclass is #{self.class.superclass}"
		puts "It has #{@wheels_number} wheels"
		write_position
		self.class.display_vehicle_count
	end
		
end