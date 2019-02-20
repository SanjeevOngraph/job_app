module ApplicationHelper
	def is_employer?
		if current_user.role == 'employer'
			return true
		else
			return false
		end
	end
end
