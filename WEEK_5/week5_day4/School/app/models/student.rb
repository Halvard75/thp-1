class Student < ApplicationRecord
	has_many :classes, through: :plannings
	has_many :plannings
end
