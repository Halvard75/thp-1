class Classe < ApplicationRecord
	has_many :students, through: :plannings
	has_many :plannings

end
