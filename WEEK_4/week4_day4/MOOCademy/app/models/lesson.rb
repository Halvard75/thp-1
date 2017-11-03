class Lesson < ApplicationRecord
  belongs_to :cour
	validates :titre, presence: true

	validates :body, presence: true	
end
