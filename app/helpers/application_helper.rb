module ApplicationHelper
	def alert_caption(key)
		case key
		when :success
			"Well done!"
		when :info
			"Heads up!"
		when :warning
			"Warning!"
		when :danger
			"Oh snap!"
		end
	end
end
