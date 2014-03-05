module ApplicationHelper
	def alert_caption(key)
		case key
		when :success
			"Well done!"
		when :info
			""
		when :warning
			"Warning!"
		when :danger
			"Oh snap!"
		end
	end

	def set_key(key)
		case key
		when :error
			:warning
		when :success
			:success
		when :warning
			:warning
		when :danger
			:danger
		else
			:info
		end
	end
end
