module PostsHelper
	include ActionView::Helpers::DateHelper

	def time_in_words(time)
		return time_ago_in_words(time)
	end 
end


