class Comment < ApplicationRecord
	has_many:interactions
	belongs_to :new
end
