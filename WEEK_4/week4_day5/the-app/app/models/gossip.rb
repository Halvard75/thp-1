class Gossip < ApplicationRecord
	belongs_to :moussaillon
	has_many :comments
end
