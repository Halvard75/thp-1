class User < ApplicationRecord
	has_many:news
	has_many:comments
	has_many:interactions
end
