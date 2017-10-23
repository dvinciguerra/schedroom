require 'date'

class Schedroom::Date

	# return list of dates by week number starting from monday until friday
	def self.days_of_week(week)
		(1..5).map {|wday| Date.commercial(Date.today.year, week, wday) }
	end

end

