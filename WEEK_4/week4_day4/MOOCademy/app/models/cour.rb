class Cour < ApplicationRecord
  has_many :lessons
	validates :titre, presence: true

	validates :description, presence: true	
                    

end


