module AppliedHelper
	def is_applied(post)
		if Applied.where(user_id: current_user.id, post_id: post.id).exists?
			return true
		else
			return false	
		end
	end
end