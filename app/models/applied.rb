class Applied < ApplicationRecord
	belongs_to :original_post, class_name: 'Post', foreign_key: 'post_id'
	belongs_to :applied_by, class_name: 'User', foreign_key: 'user_id'
	belongs_to :created_by, class_name: 'User', foreign_key: 'emp_id'
	default_scope -> { order(created_at: :desc) }
end