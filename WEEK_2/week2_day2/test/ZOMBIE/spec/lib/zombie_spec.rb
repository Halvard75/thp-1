require "spec_helper"
require "zombie"

describe Zombie do 
	# your examples (tests) go here
	xit "is named Ash" do
		zombie = Zombie.new
		zombie.name.should == 'Ash'
	end

	 xit "has no brains" do
	 zombie = Zombie.new
	 zombie.brains.should < 1 
	end

	xit 'is hungry' do
		zombie = Zombie.new
		zombie.should be_hungry
	end
end
