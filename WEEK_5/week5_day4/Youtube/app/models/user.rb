class User < ApplicationRecord
	  has_many :videos
  has_many :categories, through: :videos
end
