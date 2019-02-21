class Applied < ApplicationRecord
	has_many :posts
	default_scope -> { order(created_at: :desc) }
end